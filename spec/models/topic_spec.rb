require 'spec_helper'

describe Topic do
  include_examples 'valid factory'

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user) }
  end

   describe 'associations' do
    it { should belong_to(:user) }
  end
end
