# Create/Regenerate/Remove a key pair on the GPG keymaster
# This definition is private and SHALL NOT be called driectly!
# It is called from gpg::key to create virtual keys,
# which are realise in gpg::keymaster
define gpg::keymaster::setup(
  $ensure,
  $force,
  $keytype,
  $keylength,
  $subkeytype,
  $subkeylength,
  $email,
  $password,
  $armour,
  $expiry,
  $maxdays,
  $mindate,
  $warn_expiry
){
  include gpg::params

  Exec{ path => ['/usr/bin','/usr/sbin','/bin','/sbin']}

  File{
    owner   => puppet,
    group   => puppet,
    mode    => 600,
  }

  $key_dir      = "${gpg::params::ring_dir}/${title}"
  $keygen_file  = "${key_dir}/keygen.txt"
  $secret_file  = "${key_dir}/${title}_secret.gpg"
  $public_file  = "${key_dir}/${title}_public.gpg"

  if $ensure = 'present' {
    # Remove existing key pair, if;
    # $force is true, or
    # $maxdays or $mindate criteria isn't met (if set)

    if $force {
      $reason = 'force is true'
    }

    if !$reason and $mindate and generate("/usr/bin/find", $secret_file, "!", "-newermt", "${mindate}") {
        $reason = "created before ${mindate}"
    }

    if !$reason and $maxdays and generate("/usr/bin/find", $secret_file, "-mtime", "+${maxdays}") {
      $reason = "older than ${maxdays} days"
    }

    if $reason {
      Exec{"Revoke previous GPG key ${title}: ${reason}":
        command => "rm ${secret_file} ${public_file} ${keygen_file}",
        before  => Exec["Create GPG keygen file for ${title}","Create GPG key pair for ${title}"]
      }
    }

    # Create the GPG key gen file for using gpg in batch mode

    # Create the GPG key pair

  }
}