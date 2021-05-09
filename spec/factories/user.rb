FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "123456" }
    password_confirmation { "123456" }

    factory :user_with_user_exams do
      transient do
        user_exams_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:user_exam, evaluator.user_exams_count, user: user)
        user.reload
      end
    end
  end
end
