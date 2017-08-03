FactoryGirl.define do
  factory :employee do
    gender :male
    age 28
    name 'test'

    trait :male { gender :male }
    trait :female { gender :female }
    trait :other { gender :other }

    factory :employee_male, traits: [:male]
    factory :employee_female, traits: [:female]
    factory :employee_other, traits: [:other]
  end
end
