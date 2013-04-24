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
  $realname,
  $password,
  $armour,
  $expiry,
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

  file { $key_dir:
    ensure  => directory,
    mode    => 644;
  }

  if $ensure == 'present' {
    # Remove existing key pair, if;
    # $force is true

    $secret_content = file($secret_file,'/dev/null')
    if $secret_content {


      if $force {
        $reason = 'force is true'
      }

      if $reason {
        exec{"Revoke previous GPG key ${title}: ${reason}":
          command => "rm ${secret_file} ${public_file} ${keygen_file}",
          before  => Exec["Create GPG keygen file for ${title}","Create GPG key pair for ${title}"]
        }
      }
    }
  }
  # Check certificate expiry

  # Putting some of the key parameters in the comment
  $comment = "${keytype} ${keylength} ${subkeytype} ${subkeylength}"

  # Create the GPG key gen file for using gpg in batch mode
  file{$keygen_file:
    ensure  => $ensure,
    content => template('gpg/keygen.txt.erb')
  }

  # Create the GPG key pair
}