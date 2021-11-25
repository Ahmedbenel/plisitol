class ReviewsController < ApplicationController
  def create
    @program = Program.find(params[:program_id])
    @review = Review.new(review_params)
    @watching = Watching.create(program: @program, user: current_user)
    @review.watching = @watching
    if @review.save
      redirect_to program_path(@program)
    else
      render 'programs/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
