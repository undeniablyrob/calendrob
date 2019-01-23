class TwilioTextMessenger
  def initialize(message, to_number)
    @message = message
    @to_number = to_number
  end

  def call
    client.messages.create({
      from: from_number,
      to: to_number,
      body: message,
    })
  end

  private

  attr_reader :message, :to_number

  def client
    @client ||= Twilio::REST::Client.new
  end

  def from_number
    "+14705581075"
  end
end