class UsersController < ApplicationController

  def index
    @events = Event.all
  end

  def homepage
  end
end
