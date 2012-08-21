class GroupsController < ApplicationController
  
  def show
    @group = Group.find(params[:id])  
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      redirect_to signup_path
    else
      render 'new'
    end
  end

  def join
  end

end
