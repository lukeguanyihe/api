FactoryBot.define do
  factory :comment do
    context { "MyText" }
    article { nil }
    user { nil }
  end
end
