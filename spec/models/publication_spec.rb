require 'rails_helper'

RSpec.describe Publication, :type => :model do
  it { should validate_presence_of :book }
  it { should validate_presence_of :author }
end
