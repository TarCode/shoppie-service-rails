require 'rails_helper'

RSpec.describe List, type: :model do
  subject do
    @user = User.new(
      email: 'test@test.com',
      password: 'test'
    )
    described_class.new(name: 'test list', user: @user)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
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
