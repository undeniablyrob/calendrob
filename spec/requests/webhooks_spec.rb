require "rails_helper"

RSpec.describe "Webhooks API", type: :request do
  describe "POST /invitee_created" do
    let(:invitee_created_file) { file_fixture("webhook_invitee_created.json") }
    let(:invitee_created_json) { JSON.parse(invitee_created_file.read) }
    let(:mock_messenger) { instance_double(EventBookedMessenger, call: nil) }

    before do 
      expect(EventBookedMessenger).to receive(:new).and_return(mock_messenger)
    end

    it "is successful" do
      post "/webhooks/invitee_created", params: invitee_created_json
      expect(response).to be_successful
    end

    it "includes the Event created" do
      post "/webhooks/invitee_created", params: invitee_created_json
      expect(json).not_to be_empty
      expect(json["uuid"]).to eq(invitee_created_json["payload"]["event"]["uuid"])
    end

    it "saves the event from the payload" do
      expect {
        post "/webhooks/invitee_created", params: invitee_created_json
      }.to change { Event.count }.by(1)
    end

    it "sends a text to the publisher of the event" do
      expect(mock_messenger).to receive(:call)
      post "/webhooks/invitee_created", params: invitee_created_json
    end

    it "allows for null cancellation data"

    context "when there is no payload" do
      it "raises an error"
    end

    context "when there is no event UUID" do
      it "raises an error"
    end
  end
end
