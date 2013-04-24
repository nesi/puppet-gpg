define gpg::key (
  $ensure       = 'present',
  $force        = false,
  $keytype      = 'default',
  $keylength    = undef,
  $expiry       = 0,
  $warn_expiry  = 21,
  $subkeytype   = 'default',
  $subkeylength = undef,
  $email        = 'puppet@localhost',
  $realname     = 'not given',
  $password     = '',
  $armour       = true
){

  include gpg::params

  # Validate the key title
  gpg::namecheck{"${title}-title":
    parm  => 'title',
    value => $title
  }

  # apply defaults
  $_keylength = $keytype ? {
    'rsa' => $keylength,
    'dsa' => 1024
  }

  @gpg::setup{$title:
    ensure        => $ensure,
    force         => $force,
    keytype       => $keytype,
    keylength     => $_keylength,
    subkeytype    => $subkeytype,
    subkeylength  => $subkeylength,
    email         => $email,
    realname      => $realname,
    password      => $password,
    armour        => $armour,
    expiry        => $expiry,
    warn_expiry   => $warn_expiry
  }

}