FactoryBot.define do 
  factory :event do
    uuid { Faker::Lorem.word }
    start_time { 6.hours.ago }
    end_time { 5.hours.ago }
    duration { 1 }
    created_at { 24.hours.ago }
    invitees_count { 3 }
    location { Faker::Lorem.word }
    canceled { true }
    canceler_name { "foobar" }
    canceled_at { 4.hours.ago }
  end
end
