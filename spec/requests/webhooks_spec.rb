require "rails_helper"

RSpec.describe "Webhooks API", type: :request do
  describe "POST /invitee_created" do
    let(:invitee_created_file) { file_fixture("webhook_invitee_created.json") }
    let(:invitee_created_json) { JSON.parse(invitee_created_file.read) }

    before do
      post "/webhooks/invitee_created", params: invitee_created_json
    end

    it "is successful" do
      expect(response).to have_http_status(204)
    end
  end
end
