class Event < ApplicationRecord
  validates_presence_of :uuid, 
                        :start_time, 
                        :end_time,
                        :duration,
                        :created_at,
                        :location
end
