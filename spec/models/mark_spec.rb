require 'spec_helper'

describe Mark do
  include_examples 'valid factory'

   describe 'validations' do
    it { should validate_presence_of(:user_id) }
  end

   describe 'associations' do
    it { should belong_to(:user) }
  end
end
