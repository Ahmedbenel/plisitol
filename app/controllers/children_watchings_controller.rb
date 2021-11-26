class ChildrenWatchingsController < ApplicationController
  def new
    @children_watching = ChildrenWatching.new
    @watching = Watching.find(params[:watching_id])
  end

  # def create
  # end
end
