FactoryGirl.define do

  name = Faker::GameOfThrones.character

  factory :artist do
    sequence :name do |n|
      Faker::GameOfThrones.character + " #{n}"
    end
    image_path "https://robohash.org/#{name}"
  end
end
