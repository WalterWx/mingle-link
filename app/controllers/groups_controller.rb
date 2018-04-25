class GroupsController < ApplicationController

 	def index
  	@groups = Group.all
  end

	def new
  end

  def show

  	@group = Group.find(params[:id])
    @group.event_id = params[:event_id]
  end

  def edit
    @group = Group.find(params[:id])

  end

def create

  	@group = Group.new(group_params)
    @group.event_id = params[:event_id]
  	
  	if (@group.save)
  		redirect_to event_groups_path
  	else render 'new'
  	end

  end

    def update
       byebug
    @group = Group.find(params[:id])
   
    if(@group.update(group_params))
      redirect_to event_group_path
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.show = false
    @group.save
    redirect_to event_groups_path

  end

private

	def group_params
		params.require(:group).permit(:title, :description, :id, :event_id)
	end

end
