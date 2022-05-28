require 'rails_helper'

RSpec.describe Test, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe User, type: :model do
  describe 'relation' do
    it { should have_many(:posts) }
  end

  describe 'validation' do
    subject { FactoryBot.build(:user) }
    it { should validate_presence_of :email }
  end
end