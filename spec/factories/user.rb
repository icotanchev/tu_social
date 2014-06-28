FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@test.com" }
    sequence(:first_name) { |n| "First_Name_Of_User_#{n}" }
    sequence(:last_name) { |n| "Last_Name_Of_User_#{n}" }
    password 'test123456'
    password_confirmation { password }

    trait :student do
      email 'student@test.com'
      first_name 'John'
      last_name 'Doe'
      password 'john:doe75'
      password_confirmation { password }
    end
    
    trait :professor do
      email 'professor@gmail.com'
      first_name 'professor'
      last_name 'professor'
      role '1'
      password 'test123456'
      password_confirmation { password }
    end
  end
end
