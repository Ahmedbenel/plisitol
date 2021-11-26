class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @program = Program.find(params[:program_id])
    @favorite.program = @program
    @favorite.user = current_user
    @favorite.save
    redirect_to programs_path
  end

  def destroy
    @favorite = Favorite.new
    @program = Program.find(params[:program_id])
    @favorite.program = @program
    @favorite.user = current_user
    @favorite.destroy
    redirect_to programs_path
  end
end
