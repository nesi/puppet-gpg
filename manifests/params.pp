class "gpg::params" {

case $::osfamily {
  'Debian', 'RedHat':{
    $package  = 'gnupg'
  }
  default {
    fail("The operating system family ${::osfamily} is not supported by the puppet-gpg module on ${::fqdn}")
  }
}

}