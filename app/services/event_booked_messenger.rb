class EventBookedMessenger
  def initialize(event)
    @event = event
  end

  def call
    TwilioTextMessenger.new(message, to_number).call
  end

  private

  def to_number
    "+17709284808"
  end

  def message
    "You have a meeting booked!"
  end
end