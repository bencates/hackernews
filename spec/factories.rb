FactoryGirl.define do
  factory :story do
    title { |n| "Google #{n}" }
    url { |n| "http://google.com/q=#{n}" }
  end
end
