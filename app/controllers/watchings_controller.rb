class WatchingsController < ApplicationController
  def create
    @watching = Watching.new
    @user = current_user
    @program = Program.find(params[:program_id])
    @watching.user = @user
    @watching.program = @program
    if watching.save
      redirect_to 'children_watchings#new'
    end
  end
end
