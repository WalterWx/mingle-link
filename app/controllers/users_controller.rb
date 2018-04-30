class UsersController < ApplicationController

  def index
    redirect_to events_path
  end

  def homepage
  	redirect_to events_path
  end
end
