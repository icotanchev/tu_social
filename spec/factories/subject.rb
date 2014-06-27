FactoryGirl.define do
  factory :subject do
    sequence(:title) { |n| "Title_#{n}" }
    sequence(:subject_info) { |n| "Subject_Info_#{n}" }
    sequence(:exam_info) { |n| "Exam_info_#{n}" }
    sequence(:requirements) { |n| "requirements_#{n}" }

    association :user
  end
end
