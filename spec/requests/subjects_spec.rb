require 'spec_helper'

describe 'Subjects' do
	include AuthenticationHelper

	before(:all) { generates_subjects }

	context 'students can read and search only' do

		before(:each) do	
			visit_protected root_path
		end

	  it 'list subjects' do
	  	click_link 'Subjects'

	  	expect(page).to have_text 'Listing subjects'
			expect(page).to have_link 'Title'
			expect(page).to have_link 'Exam info'
			expect(page).to have_link	'Subject info'
			expect(page).to have_link 'Requirements'
			expect(page).to have_link	'Created at'
			expect(page).to have_text 'Teacher name'

			Subject.all.each do |subj|
				expectations(subj)
			end
	  end

	  context 'search subjects' do
	  	before(:each) { @subject = Subject.last }

	  	it 'can search by title' do
	  		click_link 'Subjects'

	  		fill_in 'q_title_cont', with: @subject.title
	  		click_button 'Search'

	  		expectations(@subject)
			end

			it 'can search by Exam info' do
	  		click_link 'Subjects'

	  		fill_in 'q_exam_info_cont', with: @subject.exam_info
	  		click_button 'Search'

	  		expectations(@subject)
	  	end

	  	it 'can search by Subject info' do
	  		click_link 'Subjects'

	  		fill_in 'q_subject_info_cont', with: @subject.subject_info
	  		click_button 'Search'

	  		expectations(@subject)
	  	end

	  	it 'can search by requirements' do
	  		click_link 'Subjects'

	  		fill_in 'q_requirements_cont', with: @subject.requirements
	  		click_button 'Search'

				expectations(@subject)
	  	end
	  end

	  context 'authorisation limits' do
	  	it 'can not create new subject' do
	  		visit new_subject_path

	  		expect(page).to have_text 'You are not authorized to access this page.'
	  		expect(current_path).to eq root_path
	  	end
	  end
	end

	context 'users with profeesor role can make crud operations' do
		before(:each) { visit_protected_as_professor root_path }

		it 'can create new subject' do
			click_link 'Subjects'
			click_link 'New Subject'

			expect(current_path).to eq new_subject_path
			expect(page).to have_text 'New subject'

			fill_in 'subject_title', with: 'New subject'
			fill_in 'subject_exam_info', with: 'New exam info'

			click_button 'Update'

			expect(current_path).to eq subject_path(Subject.last.id)

			expect(page).to have_text 'New subject'
			expect(page).to have_text 'New exam info'
			expect(page).to have_text 'Subject was successfully created.'
		end

		it 'can edit subject' do
			sub = Subject.first
			click_link 'Subjects'
			click_link "edit_subject_#{sub.id}"

			expect(current_path).to eq edit_subject_path(sub.id)			

			fill_in 'subject_title', with: 'Edit subject'
			fill_in 'subject_exam_info', with: 'Edit exam info'

			click_button 'Update'

			expect(page).to have_text 'Edit subject'
			expect(page).to have_text 'Edit exam info'
			expect(page).to have_text 'Subject was successfully updated.'
		end

		it 'can destroy subject' do
			sub = Subject.first
			click_link 'Subjects'

			expect {
				click_link "delete_subject_#{sub.id}"
			}.to change(Subject, :count).by(-1)
		end
	end

	context 'comment' do
		before(:each) { visit_protected root_path }

		it 'can add comments to subject' do
 			sub = Subject.first
			click_link 'Subjects'
			click_link "view_subject_#{sub.id}"

			expect(current_path).to eq subject_path(sub.id)			

			expect(page).to have_text 'Comments'

			fill_in 'comment_content', with: 'Test Comment'
			click_button 'Create comment'

			expect(current_path).to eq subject_path(sub.id)
			expect(page).to have_text 'Test Comment'
 		end
	end

  private

  def generates_subjects
  	5.times { create(:subject) }
  end

  def expectations(subject)
  	expect(page).to have_text subject.title
  	expect(page).to have_text subject.subject_info
  	expect(page).to have_text subject.exam_info
  	expect(page).to have_text subject.requirements
  end
end
