require 'spec_helper'

describe 'Marks' do
	include AuthenticationHelper

	context 'only students can see marks' do
		before(:each) do	
			visit_protected root_path
		end

	 #  it 'list subjects' do
	 #  	2.times {click_link 'Marks'}

	 #  	expect(page).to have_text 'Your marks are not configured'
		# 	expect(page).to have_link 'Check marks'
		# end

		# context 'when user pin and faculti is missing' do
		# 	it 'flash msg and redirect user to profile' do
		# 		click_link 'Marks'
		# 		click_link 'Check marks'

		# 		expect(page).to have_text "Configure your 'PIN' and 'Faculty number' to download marks !"
		# 		expect(current_path).to eq exit_user_path(User.last.id)
		# 	end
		# end
	end
end