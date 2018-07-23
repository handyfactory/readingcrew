class AdminController < ApplicationController
  before_action :authenticate_user!
  def clubs
    @clubs=Club.all
  end

  def cbooks
  end

  def users
  end
end
