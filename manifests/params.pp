class gpg::params {

case $::osfamily {
  'Debian', 'RedHat':{
    $package            = 'gnupg'
    $gpgme_package      = 'gpgme'
    $gpgme_provider     = 'gem'
    $ring_dir           = '/var/lib/puppet-keymaster/gpg'
    $ring_file          = "${ring_dir}/gpg_keyring.gpg"
  }
  default: {
    fail("The operating system family ${::osfamily} is not supported by the puppet-gpg module on ${::fqdn}")
  }
}

}