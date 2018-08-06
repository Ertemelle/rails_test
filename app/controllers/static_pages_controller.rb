class StaticPagesController < ApplicationController
  #before_action :require_login
  def home
  end

  def club
		@users = User.all
  end
end
