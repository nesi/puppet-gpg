require 'spec_helper'

describe 'gpg', :type => :class do
    it { should include_class("gpg::params")}
    it { should contain_file("/var/lib/puppet-gpg")}
    it { should contain_file("/var/lib/puppet-gpg/gpg_keymaster.gpg")}
end