class EventsController < ApplicationController

  def index
  	@events = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create

  	@event = Event.new(event_params)
  	@event.show = true

# taken from https://web.archive.org/web/20121026000606/http://blog.logeek.fr/2009/7/2/creating-small-unique-tokens-in-ruby
  	@event.unique_code = rand(36**8).to_s(36)
  	
  	if (@event.save)
  		redirect_to @event
  	else render 'new'
  	end

  end

  def update
  	@event = Event.find(params[:id])
  	
  	if(@event.update(event_params))
  		redirect_to @event
  	end
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to events_path

  end

  private 

  def event_params
  	params.require(:event).permit(:name, :date, :description, :id)
  end

end
