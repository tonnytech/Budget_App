require 'rails_helper'

RSpec.feature 'Groups Index Page', type: :feature do
  before(:each) do
    visit root_path
  end
  scenario 'splash page to have log in' do
    expect(page).to have_content('LOG IN')
  end
  scenario 'splash page to have sign up' do
    expect(page).to have_content('SIGN UP')
  end
  scenario 'splash page to splash logo' do
    expect(page).to have_content('Snapscan')
  end
end
