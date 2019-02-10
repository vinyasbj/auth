# frozen_string_literal: true

class Caregivers::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication
  skip_before_action :authenticate_caregiver!
  # , except: :create

  def create
    caregiver = warden.authenticate!(auth_options)
    token = Tiddle.create_and_return_token(caregiver, request)
    render json: { authentication_token: token }
  end

  def destroy
    Tiddle.expire_token(current_user, request) if current_user
    render json: {}
  end

  private

    # this is invoked before destroy and we have to override it
    def verify_signed_out_user
    end
end
