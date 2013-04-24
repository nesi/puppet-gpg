# Keymaster host:
# Creates a GnuPG keyring to store and manage GPG key pairs.
class gpg::keymaster {
  include gpg::params

  require gpg

  file{$gpg::params::ring_dir:
    ensure  => directory,
    owner   => puppet,
    group   => puppet,
    mode    => 644,
    recurse => true
  }

  file{$gpg::params::ring_file:
    ensure  => file,
    owner   => puppet,
    group   => puppet,
    mode    => 644,
    recurse => true,
    replace => false
  }

  # Realise virtual keys
  Gpg::Keymaster::Setup <| |>
}