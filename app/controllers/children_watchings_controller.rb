class ChildrenWatchingsController < ApplicationController
  def new
    @children_watching = ChildrenWatching.new
    @watching = Watching.find(params[:watching_id])
  end

  def create
    @children_watching = ChildrenWatching.new
    @watching = Watching.find(params[:watching_id])
    @children_watching.watching = @watching
    @child = Child.find(params[:child_id])
    @children_watching.child = @child
    if @children_watching.save
      redirect_to new_watching_children_watching_path(@children_watching)
    end
  end

  def destroy
    @children_watching = ChildrenWatching.find(params[:id])
    @children_watching.destroy
    redirect_to programs_path
  end
end
