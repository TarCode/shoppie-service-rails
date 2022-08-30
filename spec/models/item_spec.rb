require 'rails_helper'

RSpec.describe Item, type: :model do
  subject do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    @list = List.new(name: 'test list', user: @user)
    described_class.new(name: 'test item', list: @list, user: @user)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a list' do
    subject.list = nil
    expect(subject).to be_invalid
  end

  it 'is not valid without an name' do
    subject.name = nil
    expect(subject).to be_invalid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to be_invalid
  end
end
