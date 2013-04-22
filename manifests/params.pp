class gpg::params {

case $::osfamily {
  'Debian', 'RedHat':{
    $package          = 'gnupg'
    $gpgme_package    = 'gpgme'
    $gpgme_provider   = 'gem'
  }
  default: {
    fail("The operating system family ${::osfamily} is not supported by the puppet-gpg module on ${::fqdn}")
  }
}

}