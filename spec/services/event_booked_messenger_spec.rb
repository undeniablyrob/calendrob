require "rails_helper"

RSpec.describe EventBookedMessenger do
  let(:event) { FactoryBot.create(:event, duration: 30) }
  let(:twilio_messenger) { instance_double(TwilioTextMessenger, call: nil) }
  let(:expected_message) { "Huzzah! You have a 30-minute meeting booked on #{event.start_time.to_formatted_s(:short)}." }
  let(:expected_number) { "+17709284808" }

  subject(:service) { EventBookedMessenger.new(event) }

  it "sends the event details to the TwilioTextMessenger" do
    expect(TwilioTextMessenger).to receive(:new).with(expected_message, expected_number)
                                                .and_return(twilio_messenger)
    service.call
  end
end
