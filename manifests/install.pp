class gpg::install (
  $package
){
  package{$package:
    ensure => installed
  }
}