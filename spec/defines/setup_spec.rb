require 'spec_helper'

describe 'gpg::keymaster::setup', :type => :define do
  context "on a Debian OS" do
    let :facts do
      {
        :osfamily   => 'Debian'
      }
    end
    let(:title) { 'test' }
    it { should include_class("gpg::params")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg/test")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg/test/keygen.txt")}
  end
  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily   => 'RedHat'
      }
    end
    let(:title) { 'test' }
    it { should include_class("gpg::params")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg/test")}
    it { should contain_file("/var/lib/puppet-keymaster/gpg/test/keygen.txt")}
  end
end