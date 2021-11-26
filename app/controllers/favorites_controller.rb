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
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to programs_path notice: 'Vous avez retiré ce programme de vos favoris.' }
    end
  end
end
