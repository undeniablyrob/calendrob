class Event < ApplicationRecord
  validates_presence_of :uuid, 
                        :start_time, 
                        :end_time,
                        :duration,
                        :created_at,
                        :invitees_count,
                        :location,
                        :canceled,
                        :canceler_name,
                        :canceled_at
end
