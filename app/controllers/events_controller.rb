class EventsController < ApplicationController

  def index
  	@events = Event.all.order(datetime_start: :asc)
  end

  def show
  	@event = Event.find(params[:id])
    @groups = @event.groups()
  end

  def new
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def create

  	# @event = Event.new(event_params)
    @user = User.where(id: current_user.id).first
    @event = @user.events.create(event_params)
    @event.active = true

  # taken from https://web.archive.org/web/20121026000606/http://blog.logeek.fr/2009/7/2/creating-small-unique-tokens-in-ruby
  @event.event_id = rand(36**8).to_s(36)

  if (@event.save)
    EventsUser.where('user_id = ' + current_user.id.to_s + ' and event_id = ' + @event.id.to_s).update_all(user_role: 'owner')
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
   @event.show = false
   @event.save
   redirect_to events_path

  end

  private 

  def event_params
   params.require(:event).permit(:title, :datetime_start, :datetime_end, :location, :description, :location, :id, :active)
  end

end
