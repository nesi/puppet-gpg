class gpg::install {

  package{$gpg::params::package:
    ensure => installed
  }

  package { $gpg::params::gpgme_package:
    ensure    => 'installed',
    provider  => $gpg::params::pgme_provider,
    require   => Package[$gpg::params::package]
  }

}