require 'spec_helper'

describe 'Topics' do
  include AuthenticationHelper

  it 'visit marks' do
    visit_protected root_path

    expect(page).to have_link 'TU Social'
    expect(page).to have_link 'Home'
    expect(page).to have_link 'Students'
    expect(page).to have_link 'Subjects'
    expect(page).to have_link 'Teachers'

    # expect(page).to have_text 'Your marks are not configured'
  end
end