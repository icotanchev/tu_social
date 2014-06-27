FactoryGirl.define do
  factory :message do
    sequence(:subject) { |n| "Subject_#{n}" }
    sequence(:content) { |n| "Content_#{n}" }
    sequence(:recipient) { |n| "#{n}" }
    sequence(:sender) { |n| "#{n.to_i + 1}" }
  end
end
