require 'spec_helper'

describe 'Change password' do
  include AuthenticationHelper

  it 'An user can change successfully password with valid params' do
    create(:user, :student)

    visit new_user_session_path

    fill_signin_form_with username: 'student@test.com', password: 'john:doe75'

    click_link 'Change password'
    
    expect(current_path).to eq edit_user_registration_path

    fill_in :user_current_password, with: 'john:doe75' 
    fill_in :user_password, with: 'Test1234!!!!'
    fill_in :user_password_confirmation, with: 'Test1234!!!!'

    click_button 'Update'

    expect(current_path).to eq root_path

    click_link 'Sign Out'
    
    expect(current_path).to eq new_user_session_path

    fill_signin_form_with username: 'student@test.com', password: 'john:doe75'
    expect(current_path).to eq new_user_session_path

    fill_signin_form_with username: 'student@test.com', password: 'Test1234!!!!'
    expect(current_path).to eq root_path
  end

  it 'An user can not change password with invalid current password' do
    create(:user, :student)

    visit new_user_session_path

    fill_signin_form_with username: 'student@test.com', password: 'john:doe75'

    click_link 'Change password'
    
    expect(current_path).to eq edit_user_registration_path

    fill_in :user_current_password, with: :invalid_current_password 
    fill_in :user_password, with: 'Test1234!!!!'
    fill_in :user_password_confirmation, with: 'Test1234!!!!'

    click_button 'Update'

    expect(page).to have_text 'Current password is invalid'
  end

  it 'An user can not change password when new password is less than 10 characters' do
    create(:user, :student)

    visit new_user_session_path

    fill_signin_form_with username: 'student@test.com', password: 'john:doe75'

    click_link 'Change password'
    
    expect(current_path).to eq edit_user_registration_path

    fill_in :user_current_password, with: 'john:doe75'
    fill_in :user_password, with: 'Pass'
    fill_in :user_password_confirmation, with: 'Pass'

    click_button 'Update'

    expect(page).to have_text 'Password is too short (minimum is 8 characters)'
  end
end
