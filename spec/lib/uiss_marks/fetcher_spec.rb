require 'spec_helper'
require 'mechanize'

describe UissMarks::Fetcher do
	describe '#fetch!' do
		it 'returns hash with marks' do
			agent = double(Mechanize).as_null_object
			Mechanize.stub(:new) { agent }
			agent.stub(:get) { returned_hash_from_uiss }

			user = create(:user, pin: '2203034543', faculty_number: '000030000')
			UissMarks::Fetcher.new(user.pin, user.faculty_number).fetch!
		end 
	end

	def returned_hash_from_uiss
		{
			first: ['first'],
			second: ['second']
		}
	end
end