require 'spec_helper'

describe 'gpg', :type => :class do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily   => 'Debian'
      }
    end
    it { should create_class("gpg::install") }
    it { should contain_package("gnupg") }
    it { should contain_package("gpgme") }
  end

  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily   => 'RedHat'
      }
    end
    it { should create_class("gpg::install") }
    it { should contain_package("gnupg") }
    it { should contain_package("gpgme") }
  end
end