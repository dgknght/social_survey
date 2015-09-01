require 'rails_helper'

describe User do
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
end
