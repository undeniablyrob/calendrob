class WebhooksController < ApplicationController
  def invitee_created
    @event = Event.create!(
      uuid:          invitee_created_params[:event][:uuid],
      start_time:    invitee_created_params[:event][:start_time],
      end_time:      invitee_created_params[:event][:end_time],
      duration:      invitee_created_params[:event_type][:duration],
      created_at:    invitee_created_params[:event][:created_at],
      location:      invitee_created_params[:event][:location],
      canceled:      invitee_created_params[:event][:canceled],
      canceler_name: invitee_created_params[:event][:canceler_name],
      cancel_reason: invitee_created_params[:event][:cancel_reason],
      canceled_at:   invitee_created_params[:event][:canceled_at],
    )
    
    json_response(@event)
  end

  private

  def invitee_created_params
    @invitee_created_params ||= params.require(:payload)
  end
end
