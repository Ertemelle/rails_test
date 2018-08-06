class StaticPagesController < ApplicationController
  before_action :require_login, only: [:club]
  def home
  end

  def club
		@users = User.all
  end
end
