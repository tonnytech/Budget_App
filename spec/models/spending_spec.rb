require 'rails_helper'

RSpec.describe Spending, type: :model do
  before(:each) do
    @user1 = User.create(name: 'Tonny', email: 'tonnytei4@gmail.com', password: 'Danger123',
                         password_confirmation: 'Danger123')
    @spending1 = Spending.create(name: 'Milk juice', amount: 2.50, user_id: @user1.id)
  end

  it 'Should have valid attributes' do
    expect(@spending1).to be_valid
  end

  it 'Should have a name' do
    @spending1.name = nil
    expect(@spending1).to_not be_valid
  end

  it 'Should have an amount' do
    @spending1.amount = nil
    expect(@spending1).to_not be_valid
  end

  it 'Should have an amount as an interger' do
    @spending1.amount = 2
    expect(@spending1).to be_valid
  end

  it 'Should have a name as a string' do
    @spending1.name = 'Milk juice'
    expect(@spending1).to be_valid
  end

  it 'Should have a user' do
    @spending1.user_id = nil
    expect(@spending1).to_not be_valid
  end
end
