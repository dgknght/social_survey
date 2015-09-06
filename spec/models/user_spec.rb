require 'rails_helper'

describe User do
  let (:user) {FactoryGirl.create(:user)}
  let (:attributes) do
    {
      email: 'john@doe.com',
      password: 'please01',
      password_confirmation: 'please01'
    }
  end

  it 'can be created from valid attributes' do
    user = User.new(attributes)
    expect(user).to be_valid
  end

  describe '#surveys' do
    it 'contains the surveys that belong to the user' do
      user = User.create
      expect(user).to have(0).surveys
    end
  end
end
