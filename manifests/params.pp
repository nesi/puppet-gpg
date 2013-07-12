#Parameter values for gpg module
class gpg::params {

  #Default values
  $gpgme_package      = 'gpgme'
  $gpgme_provider     = 'gem'
  $ring_dir           = '/var/lib/puppet-keymaster/gpg'
  $ring_file          = "${ring_dir}/gpg_keyring.gpg"

  case $::osfamily {
    'RedHat': {
      $package = 'gnupg2'
    }
    'Debian': {
      $package = 'gnupg'
    }
    default: {
      fail("The operating system family ${::osfamily} is not supported by the puppet-gpg module on ${::fqdn}")
    }
  }

}
