require "rails_helper"

RSpec.describe TwilioTextMessenger do
  let(:to_number) { "+15558675309" }
  let(:message) { "Hello, world! My name is Inigo Montoya." }
  let(:twilio_messsages) { instance_double(Twilio::REST::Api::V2010::AccountContext::MessageList, create: nil) } 
  let(:twilio_client) { instance_double(Twilio::REST::Client, messages: twilio_messsages) }
  
  subject(:service) { TwilioTextMessenger.new(message, to_number) }

  before do
    expect(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
  end

  it "delegates the message to the Twilio client" do
    expect(twilio_messsages).to receive(:create).with(hash_including(
      :from,
      to: to_number,
      body: message,
    ))
    service.call
  end
end