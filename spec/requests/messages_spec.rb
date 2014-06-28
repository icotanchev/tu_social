require 'spec_helper'

describe 'Messages' do
  include AuthenticationHelper

  before(:all) { @user = create(:user) }

	before(:each) do
		visit_protected root_path
	end

	it 'can sends emails' do
		click_link 'Students'

		expect(page).to have_text @user.full_name

		click_link 'Send Message'

		expect(page).to have_text 'New message'

		fill_in 'message_subject', with: 'new message'
		fill_in 'message_content', with: 'message content'

		expect {
			click_button 'Send'
		}.to change(Message, :count).by(1)
	end

	it 'can lists send msgs' do
		msg = create(:message, sender: User.last.id, recipient: @user.id)

		click_link 'Sent messages'

		expect(page).to have_text 'Sent messages'
		expect(page).to have_text 'Recipient'
		expect(page).to have_text 'Content'
		expect(page).to have_text 'Subject'
		expect(page).to have_text msg.content
		expect(page).to have_text msg.subject
	end

	it 'shows number of unreaded msg and change the count when readed' do
		msg = []
		22.times { msg << create(:message, sender: @user.id, recipient: User.last.id) }
		
		click_link 'Received messages'
		
		expect(page).to have_text 22

		click_link "view_message_#{msg.first.id}"

		visit root_path
		within('li.dropdown#account_drop_down_id') { expect(page).to have_text 21 }

		click_link 'Received messages'
		click_link 'Mark all as readed'
		
		within('li.dropdown#account_drop_down_id') { expect(page).to_not have_text 21 }	
	end

	it 'can lists received msgs' do
		msg = create(:message, sender: @user.id, recipient: User.last.id)

		click_link 'Received messages'

		expect(page).to have_text 'Received messages'
		expect(page).to have_text 'From'
		expect(page).to have_text 'Subject'
		expect(page).to have_text 'Content'
		expect(page).to have_text msg.content
		expect(page).to have_text msg.subject
	end
end
