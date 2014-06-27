FactoryGirl.define do
  factory :mark do
  	marks { 'marks' }

  	association :user
  end
end
