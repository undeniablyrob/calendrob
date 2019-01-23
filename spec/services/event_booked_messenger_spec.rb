require "rails_helper"

RSpec.describe EventBookedMessenger do
  let(:event) { FactoryBot.create(:event) }
  let(:twilio_messenger) { instance_double(TwilioTextMessenger, call: nil) }
  let(:expected_message) { "You have a meeting booked!" }
  let(:expected_number) { "+17709284808" }

  subject(:service) { EventBookedMessenger.new(event) }

  it "sends the event details to the TwilioTextMessenger" do
    expect(TwilioTextMessenger).to receive(:new).with(expected_message, expected_number)
                                                .and_return(twilio_messenger)
    service.call
  end
end
