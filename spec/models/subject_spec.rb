require 'spec_helper'

describe Subject do
  include_examples 'valid factory'

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:user) }

    it 'presence of one more attribute except title' do
    	expect {
    		create(:subject, subject_info: nil, exam_info: nil, requirements: nil)
    	}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
