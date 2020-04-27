# frozen_string_literal: true

class HomesController < ApplicationController
  before_action :authenticate_user_from_token!

  def index; end
end
