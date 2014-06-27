require 'spec_helper'

describe Message do
  include_examples 'valid factory'

  describe 'validations' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:sender) }
    it { should validate_presence_of(:recipient) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
