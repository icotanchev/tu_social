require 'spec_helper'

describe Comment do
  
  include_examples 'valid factory'

   describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:content) }
  end

   describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
  end
end
