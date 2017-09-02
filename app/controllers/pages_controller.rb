class PagesController < ApplicationController
  # 14/03 5
 skip_before_action :authenticate_user!

  def feed
  end
end
