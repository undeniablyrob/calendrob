require "rails_helper"

RSpec.describe "Events API", type: :request do
  let(:event) { FactoryBot.create(:event) }

  describe "GET /events" do
    before do
      FactoryBot.create_list(:event, 2)
      get "/events"
    end

    it "returns events" do
      expect(json.count).to eq(2)
    end
  end
end
