require 'spec_helper'

describe UissMarks::MarksConfigurator do
	context '#configure_marks' do
		it 'downloads user marks if pin and faculty number present and role is student' do
			fetch = double(UissMarks::Fetcher).as_null_object
			UissMarks::Fetcher.stub(:new) {fetch}
			fetch.stub(:fetch!) {returned_hash_from_uiss}
			user = create(:user, pin: '2203034543', faculty_number: '000030000')
			user_mark = create(:mark, user: user)

			expect(user.mark.marks).to eq 'marks'

			UissMarks::MarksConfigurator.new(user.id).configure_marks

			expect(Mark.where(user_id: user.id).first.marks).to eq returned_hash_from_uiss	
		end

		context 'does not init Fetcher if pin or faculty number blank or role is professor' do
			it 'when pin is blank' do
				user = create(:user, pin: nil, faculty_number: '000030000')
				UissMarks::Fetcher.should_not_receive(:new)

				UissMarks::MarksConfigurator.new(user.id).configure_marks
			end

			it 'when faculty_number is blank' do
				user = create(:user, pin: '2203034543', faculty_number: nil)
				UissMarks::Fetcher.should_not_receive(:new)
				
				UissMarks::MarksConfigurator.new(user.id).configure_marks
			end

			it 'when role is professor' do
				user = create(:user, :professor)
				UissMarks::Fetcher.should_not_receive(:new)
				
				UissMarks::MarksConfigurator.new(user.id).configure_marks
			end
		end
	end

	def returned_hash_from_uiss
		{
			first: ['first'],
			second: ['second']
		}
	end
end
