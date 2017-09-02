class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 14/03 1
  before_action :authenticate_user!

end
