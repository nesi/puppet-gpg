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
  $expiry
){
  include gpg::params
  Exec{ path => ['/usr/bin','/usr/sbin','/bin','/sbin']}

  File{
    owner   => puppet,
    group   => puppet,
    mode    => 600,
  }

  $key_gen_file    = "${gpg::params::keymaster_ring_dir}/${title}/gpg_gen.txt"
  $secret_key_file = "${gpg::params::keymaster_ring_dir}/${title}/${title}_secret.gpg"
  $public_key_file = "${gpg::params::keymaster_ring_dir}/${title}/${title}_public.gpg"

  case $ensure {

  }
}