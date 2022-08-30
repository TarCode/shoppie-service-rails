require 'rails_helper'

RSpec.describe List, type: :model do
  it 'is valid with valid attributes' do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    expect(List.new(name: 'test list', user: @user)).to be_valid
  end

  it 'is not valid without an name' do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    expect(List.new(user: @user)).to be_invalid
  end

  it 'is not valid without a user' do
    expect(List.new(name: 'test list')).to be_invalid
  end
end
