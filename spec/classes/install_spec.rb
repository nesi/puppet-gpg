require 'spec_helper'

describe 'gpg::install', :type => :class do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily   => 'Debian'
      }
    end
    it { should contain_package("gnupg") }
  end

  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily   => 'RedHat'
      }
    end
    it { should contain_package("gnupg") }
  end
end