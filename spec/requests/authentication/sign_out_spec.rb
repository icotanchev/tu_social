require 'spec_helper'

feature 'Sign Out' do
  include AuthenticationHelper

  scenario 'An user signs out successfully' do
    visit_protected root_path

    click_link 'Sign Out'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_css 'form#new_user'
    expect(page).not_to have_link 'Log Out', href: destroy_user_session_path
  end
end
