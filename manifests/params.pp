class gpg::params {

case $::osfamily {
  'Debian', 'RedHat':{
    $package          = 'gnupg'
    $gpgme_package    = 'gpgme'
    $gpgme_provider   = 'gem'
    $keymaster_ring_dir = '/var/lib/puppet-gpg'
    $keymaster_keyring  = "${keymaster_ring_dir}/gpg_keymaster.pgp"
  }
  default: {
    fail("The operating system family ${::osfamily} is not supported by the puppet-gpg module on ${::fqdn}")
  }
}

}