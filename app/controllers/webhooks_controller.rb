class WebhooksController < ApplicationController
  def invitee_created
    invitee_created_params
  end

  private

  def invitee_created_params
    @invitee_created_params ||= params.require(:payload)
  end
end
