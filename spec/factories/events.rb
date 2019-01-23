FactoryBot.define do 
  factory :event do
    uuid { Faker::Lorem.word }
    start_time { 6.hours.ago }
    end_time { 5.hours.ago }
    duration { 15 }
    created_at { 24.hours.ago }
    location { Faker::Lorem.word }
    canceled { false }
    canceler_name { nil }
    canceled_at { nil }
  end
end
