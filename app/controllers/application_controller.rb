class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # before_action :check_login
  #
  # def check_login
  #   if !logged_in?
  #     redirect_to 'sessions/new'
  #   end
  # end

end
