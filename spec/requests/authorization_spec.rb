require 'spec_helper'

describe 'Authorization' do

  it 'Professor abilities' do
    user = create(:user, :professor)

    visit root_path
    puts user.role    

    fill_signin_form_with username: user.email, password: user.password

    expect(current_path).to eq root_path

    click_link 'Subjects'
    expect(current_path).to eq subjects_path    
    
    visit new_subject_path

    expect(current_path).to eq root_path
  end

  it 'Standart user abilities' do
    user = create(:user, :student)

    visit root_path

    fill_signin_form_with username: user.email, password: user.password

    expect(current_path).to eq root_path
    
    click_link 'Subjects'
    expect(current_path).to eq subjects_path    
    
    visit new_subject_path

    expect(current_path).to eq root_path
  end

  private

  def fill_signin_form_with(params)
    within 'form#new_user' do
      fill_in 'user_email', with: params[:username]
      fill_in 'user_password', with: params[:password]
      click_button 'Sign in'
    end
  end
end

