FactoryGirl.define do
  factory :story do
    sequence(:title) { |n| "Google #{n.to_i}" }
    sequence(:url) { |n| "http://google.com/q=#{n.to_i}" }
  end

  factory :comment do
    body "This is the comment body."
    association :commentable, factory: :story
  end
end
