require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(
             email: 'test@test.com',
             password: 'test'
           )).to be_valid
  end

  it 'is not valid without an email' do
    expect(User.new(password: 'test')).to be_invalid
  end
  it 'is not valid without a password' do
    expect(User.new(
             email: 'test@test.com'
           )).to be_invalid
  end
end
