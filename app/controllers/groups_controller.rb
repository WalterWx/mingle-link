class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
  end

  def show
    @group = Group.find(params[:id])
    @group.event_id = params[:event_id]
    @list = @group.users()
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @group = @event.groups.create!(group_params)    
    @groupuser = GroupsUser.create(user_id: current_user.id , group_id: @group.id)
    redirect_to event_path(@event)
  end

  def update
    @group = Group.find(params[:id])
    if(@group.update(group_params))
      redirect_to event_path(@group.event)
    end
  end

  def destroy
    @event=Event.find(params[:event_id])
    @group = @event.groups.find(params[:id])
    @group.active = false
    @group.save
    redirect_to event_path(@event)
  end

  def join_group
    @group = Group.find_by_id(params[:id])
    if  GroupsUser.where("user_id = ? AND group_id = ?", current_user.id, @group.id).empty?
      @groupuser = GroupsUser.create(user_id: current_user.id, group_id: @group.id)
    end
    redirect_to event_group_path(@group)
  end

  def leave_group
    @event = Event.find(params[:event_id])
    @group = Group.find(params[:id])
    @groupuser = GroupsUser.destroy(user_id: current_user.id, group_id: @group.id)
    redirect_to event_path(@event)
  end

  private

  def group_params
    params.require(:group).permit(:title, :description, :id, :event_id, :group_id)
  end

end
