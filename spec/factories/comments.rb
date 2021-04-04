FactoryBot.define do
  factory :comment do
    content { "my comment" }
    association :article 
    association :user
  end
end
