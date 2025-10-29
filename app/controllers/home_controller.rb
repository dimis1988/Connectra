class HomeController < ApplicationController
  def index
    @users = User.last_five_records
  end
end
