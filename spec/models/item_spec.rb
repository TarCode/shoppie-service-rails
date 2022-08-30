require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'is valid with valid attributes' do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    @list = List.new(name: 'test list', user: @user)
    expect(Item.new(name: 'test item', list: @list, user: @user)).to be_valid
  end

  it 'is not valid without a list' do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    expect(Item.new(name: 'test item', user: @user)).to be_invalid
  end

  it 'is not valid without an name' do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    expect(Item.new(user: @user)).to be_invalid
  end

  it 'is not valid without a user' do
    expect(Item.new(name: 'test Item')).to be_invalid
  end
end
