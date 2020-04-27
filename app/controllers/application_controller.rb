# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!

  layout :layout_by_resource

  def layout_by_resource
    devise_controller? ? 'authentication' : 'application'
  end

  def authenticate_user_from_token!
    token = request.headers['token']
    user = token.present? && User.find_by_authentication_token(token)

    if user && Devise.secure_compare(user.authentication_token, token)
      sign_in user, store: false
    end
  end
end
