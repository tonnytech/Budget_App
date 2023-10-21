require 'rails_helper'

RSpec.feature 'New Food', type: :feature do
  let(:user) { User.create!(email: 'tonnytei4@gmail.com', password: 'FindaleY-1', name: 'Tonny') }

  before do
    login_as(user, scope: :user)
    visit new_category_path
  end

  scenario 'User views the new category form' do
    expect(page).to have_content('Select the icon')
  end
end
