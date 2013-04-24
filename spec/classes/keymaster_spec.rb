require 'spec_helper'

describe 'gpg::keymaster', :type => :class do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily   => 'Debian'
      }
    end
    it { should include_class("gpg::params")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg/gpg_keyring.gpg")}
  end
  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily   => 'RedHat'
      }
    end
    it { should include_class("gpg::params")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg/gpg_keyring.gpg")}
  end
end