FactoryGirl.define do
  factory :comment do
  	sequence(:content) { |n| "Content_#{n}" }
    
		association :user

  	trait :topic do
  		sequence(:content) { |n| "Content_#{n}" }
    
      association :topic
  		association :user
    end
  end
end
