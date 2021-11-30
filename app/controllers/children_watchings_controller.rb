class ChildrenWatchingsController < ApplicationController
  def index
    @children_watching = ChildrenWatching.new
    @watching = Watching.find(params[:watching_id])
    @children_watchings = @watching.children_watchings
    @user = current_user
  end

  def create
    @children_watching = ChildrenWatching.new
    @watching = Watching.find(params[:watching_id])
    @children_watching.watching = @watching
    @child = Child.find(params[:children_watching][:child_id])
    @children_watching.child = @child
    if @children_watching.save
      redirect_to watching_children_watchings_path(@watching)
    end
  end

  def destroy
    @children_watching = ChildrenWatching.find(params[:id])
    @watching = @children_watching.watching
    @children_watching.destroy
    redirect_to watching_children_watchings_path(@watching)
  end
end
