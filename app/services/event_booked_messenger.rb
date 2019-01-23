class EventBookedMessenger
  def initialize(event)
    @event = event
  end

  def call
    TwilioTextMessenger.new(message, to_number).call
  end

  private

  attr_reader :event

  def to_number
    "+17709284808"
  end

  def message
    "Huzzah! You have a #{event.duration}-minute meeting booked on #{event.start_time.to_formatted_s(:short)}."
  end
end