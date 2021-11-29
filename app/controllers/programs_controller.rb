class ProgramsController < ApplicationController
  def index
    @programs = Program.all
    return unless params[:request]

    if !(params[:request][:description].blank?)
      sql_query = "programs.description @@ :description"
      @programs = @programs.where(sql_query, description: "%#{params[:request][:description]}%")
    end
    if !(params[:request][:category].blank?)
      sql_query = "programs.category @@ :category"
      @programs = @programs.where(sql_query, category: "#{params[:request][:category]}")
    end
    if !(params[:request][:min_age].blank?)
      min_age = params[:request][:min_age].to_i
      sql_query = "programs.min_age >= :min_age"
      @programs = @programs.where(sql_query, min_age: min_age)
    end
    if !(params[:request][:length].blank?)
      min_length = params[:request][:length].split("-").first.to_i
      max_length = params[:request][:length].split("-").last.to_i
      sql_query = "programs.length >= :min_length AND programs.length < :max_length"
      @programs = @programs.where(sql_query, min_length: min_length, max_length: max_length)
    end
  end

  def show
    @program = Program.find(params[:id])
    @review = Review.new
    @watching = Watching.find_by_program_id(@program)
    @already_reviewed = @program.already_reviewed?(current_user)
  end
end
