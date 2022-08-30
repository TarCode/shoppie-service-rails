require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: 'test@test.com', password: 'test')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).to be_invalid
  end
  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to be_invalid
  end
end
