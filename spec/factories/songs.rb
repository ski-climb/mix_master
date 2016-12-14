FactoryGirl.define do
  factory :song do
    sequence :title do |n|
      "Title #{n}"
    end
    artist
  end
end
