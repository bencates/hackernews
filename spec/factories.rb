FactoryGirl.define do
  factory :story do
    sequence(:title) { |n| "Google #{n.to_i}" }
    sequence(:url) { |n| "http://google.com/q=#{n.to_i}" }
  end

  factory :comment do
    title "Comment Title"
    body "This is the comment body."
    story
  end
end
