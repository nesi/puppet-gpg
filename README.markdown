# gpg

This is a Puppet module for handing GPG keys.

[![Build Status](https://travis-ci.org/nesi/puppet-gpg.png)](https://travis-ci.org/nesi/puppet-gpg)

# Install GPG tools

To install the GPG tools:
```
include gpg
```

This should be run before using the GPG type or setting up the keymaster.

# GPG Keymaster


# Type and Provider for GPG

A `gpgkey` type is provided for managing and creating gpg keys on the fly. These will regenerate the GPG key on the node, so the GPG key will be unique each time it is created. This provider is most suitable for nodes that do not require their public GPG key to be widely published.

This has been copied from the implementation at: https://github.com/crayfishx/puppet-gpg

## Example:

```
gpgkey{'hostkey':
  ensure  => present,
  email   => 'puppet@example.org'
}
```

## Parameters

These are the parameters of the `gpgkey` type:

* **keytype**       The key type (RSA or DSA), defaults to RSA.
* **keylength**     The bit length of the generated key, defaults to 4096.
* **subkeytype**    The subkey type (RSA, Elgamal, or sign-only), defaults to RSA.
* **subkeylength**  The bit length of the generated subkey, defaults to 4096.
* **email**         The email address embedded into the key, defaults to puppet@localhost
* **expire**        The expiry string; 0 does not expire, <n> expires in n days, <n>w expires in n weeks, <n>m expires in n months, and <n>y expires in n years. Defaults to 0 and does not expire.
* **password**      Sets the key passphrase, defauls to '' (empty string).
* **armour**        Sets ASCII Armoured output, defaults to true.

**NOTE:** though the key type and subkey type can be changed, it is recommended that the defaults are used.

# Licensing

Update your license details here.

# References

* http://www.gnupg.org/ GunPG home page
* https://github.com/crayfishx/puppet-gpg used for creation of GPG keys with gpgme
* http://www.happylife.sg/index.php/2011/01/24/migrating-gpg-keys/ for migrating GPG keys around
* https://github.com/boklm/puppet-sshkeys for an example of using puppet to manage keys

# Attribution

This module is derived from the puppet-blank module by Aaron Hicks (aethylred@gmail.com)

* https://github.com/Aethylred/puppet-blank

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

# Gnu General Public License

This file is part of the gpg Puppet module.

The gpg Puppet module is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The gpg Puppet module is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the gpg Puppet module.  If not, see <http://www.gnu.org/licenses/>.