require 'rails_helper'

RSpec.describe Publisher, :type => :model do
  it { should respond_to :name }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_least(5) }
  it { should validate_uniqueness_of :name }
end
