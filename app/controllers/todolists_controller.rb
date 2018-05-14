class TodolistsController < ApplicationController

  before_action :set_todolist, :only => [:show, :edit, :update, :destroy]
  def index
    @todolists = Todolist.all
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    if @todolist.save
      redirect_to todolists_url
    else
      render :action => :new
    end
  end


#  def show
#  end

#  def edit
#  end

  def update
    if @todolist.update_attributes(todolist_params)
      redirect_to todolist_path(@todolist)
    else
      render :action => :edit
    end

  end

  def destroy
    @todolist.destroy

    redirect_to todolists_url
  end
  private

  def todolist_params
    params.require(:todolist).permit(:name, :due_date, :note)
  end

  def set_todolist
    @todolist = Todolist.find(params[:id])
  end

end
