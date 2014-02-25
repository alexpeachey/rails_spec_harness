require 'spec_helper'

describe RailsSpecHarness do
  it 'should have a version number' do
    RailsSpecHarness::VERSION.should_not be_nil
  end

  it 'should do something useful' do
    false.should be_true
  end
end
