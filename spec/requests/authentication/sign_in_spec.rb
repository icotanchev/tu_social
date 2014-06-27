require 'spec_helper'

describe 'Sign In' do
  include AuthenticationHelper

  it 'An user signs in successfully with email and password' do
    create(:user, :student)

    visit new_user_session_path

    expect(current_path).to eq new_user_session_path

    fill_signin_form_with username: 'student@test.com', password: 'john:doe75'

    expect(current_path).to eq root_path
    expect(page).to have_text 'John Doe'
    expect(page).to have_link 'Sign Out', href: destroy_user_session_path
  end

  it 'An alert message is shown when entered credentials are not valid' do
    visit new_user_session_path

    expect(current_path).to eq new_user_session_path

    fill_signin_form_with username: 'invalid', password: 'invalid'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_text 'Invalid email or password'
    expect(page).not_to have_link 'Sign out', href: destroy_user_session_path
  end
end
