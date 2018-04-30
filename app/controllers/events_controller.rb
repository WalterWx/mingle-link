class EventsController < ApplicationController
before_action :authenticate_user!

  def index
    @user = User.where(id: current_user.id).first
    @events = @user.events.all.order(datetime_start: :asc)

  end

  def show
    @user = User.where(id: current_user.id).first

# If the user try to enter events by id that he is not already part of, he is rejected
    if @user.events.find_by_id(params[:id]) != nil
      @event = Event.find_by_id(params[:id]) 

# If a link is used
    elsif Event.find_by( event_id: params[:id]) != nil
      @event = Event.find_by( event_id: params[:id]) 
      
# If user does not already belong to the event, add him in
      if @user.events.find_by_id(@event.id) == nil
        @user.events_users.create(event_id: @event.id, user_id: current_user.id )
      end
    else 
      redirect_to action: "index" 
    end
    @groups = Event.joins(:group).all
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
    @event.event_id = create_event_id

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

  def create_event_id
    adjectives = ['awesome','brave','bright','calm','creative','funny','good','neat','nice','witty']
    nouns = ['apple','orange','bird','fish','flower','box','sun','moon','car','plane']

    event_id = "" 
    unless Event.find_by_event_id(event_id)
      event_id = adjectives.sample + '-' + nouns.sample + '-' + rand(0..100000).to_s
    end

    event_id
  end
end
