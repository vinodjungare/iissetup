require 'spec_helper'
describe 'iissetup' do
  context 'with default values for all parameters' do
    it { should contain_class('iissetup') }
  end
end
