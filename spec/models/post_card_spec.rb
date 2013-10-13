require 'spec_helper'

describe PostCard do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address_line1 }
  it { should validate_presence_of :city }
  it { should validate_presence_of :zip }
  it { should validate_presence_of :state }
  it { should validate_presence_of :country }
end
