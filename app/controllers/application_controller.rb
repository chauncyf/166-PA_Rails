class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login
    include ApplicationHelper
    def require_login
      if !logged_in?
        redirect_to login_path
      end
    end
end
