require "rails_helper"

RSpec.describe TwilioTextMessenger do
  let(:to_number) { "+15558675309" }
  let(:message) { "Hello, world! My name is Inigo Montoya." }
  let(:twilio_messsages) { instance_double(Twilio::REST::Api::V2010::AccountContext::MessageList, create: nil) } 
  let(:twilio_client) { instance_double(Twilio::REST::Client, messages: twilio_messsages) }
  
  subject(:service) { TwilioTextMessenger.new(message, to_number) }

  it "delegates the message to the Twilio client" do
    expect(Twilio::REST::Client).to receive(:new).and_return(twilio_client)
    expect(twilio_messsages).to receive(:create).with(hash_including(
      :from,
      to: to_number,
      body: message,
    ))
    service.call
  end

  context "when the message is empty" do
    let(:message) { nil }
    
    it "does not attempt to send a text" do
      expect(Twilio::REST::Client).not_to receive(:new)
      service.call
    end
  end

  context "when the to number is empty" do
    let(:to_number) { nil }

    it "does not attempt to send a text" do
      expect(Twilio::REST::Client).not_to receive(:new)
      service.call
    end
  end

  context "when the to number is not valid" do
    let(:to_number) { "867-5309" }

    it "raises an error"
  end
end