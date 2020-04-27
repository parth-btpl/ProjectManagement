# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!
end
