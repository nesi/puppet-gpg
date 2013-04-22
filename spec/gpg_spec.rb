require 'spec_helper'

describe 'gpg', :type => :class do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily   => 'Debian'
      }
    end
    it { should include_class("gpg::params") }
    it { should contain_package("gnupg") }
  end

  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily   => 'RedHat'
      }
    end
    it { should include_class("gpg::params") }
    it { should contain_package("gnupg") }
  end
end