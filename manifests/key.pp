define gpg::key (
  $ensure       = 'present',
  $force        = false,
  $keytype      = 'rsa',
  $keylength    = 4096,
  $expiry       = 0,
  $maxdays      = undef,
  $mindate      = undef,
  $warn_expiry  = 21,
  $subkeytype   = 'rsa',
  $subkeylength = '4096',
  $email        = 'puppet@localhost',
  $password     = '',
  $armour       = true,
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
    password      => $password,
    armour        => $armour,
    expiry        => $expiry,
    mindate       => $mindate,
    maxdays       => $maxdays,
    warn_expiry   => $warn_expiry
  }

}