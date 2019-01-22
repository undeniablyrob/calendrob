require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to validate_presence_of(:uuid) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it { is_expected.to validate_presence_of(:duration) }
  it { is_expected.to validate_presence_of(:created_at) }
  it { is_expected.to validate_presence_of(:invitees_count) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:canceled) }
  it { is_expected.to validate_presence_of(:canceler_name) }
  it { is_expected.to validate_presence_of(:canceled_at) }
end
