FactoryGirl.define do
  factory :topic do
  	sequence(:title) { |n| "Title_#{n}" }
  	sequence(:content) { |n| "Content_#{n}_Content_" }

  	association :user
  end
end
