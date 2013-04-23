class gpg::install {

  include gpg::params

  package{$gpg::params::package:
    ensure => installed
  }

  package { $gpg::params::gpgme_package:
    ensure    => 'installed',
    provider  => $gpg::params::gpgme_provider,
    require   => Package[$gpg::params::gpgme_package]
  }

}