require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:uuid) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  
  pending "add some examples to (or delete) #{__FILE__}"
end
