class ProgramsController < ApplicationController
  def index
    @programs = Program.all
    return unless params[:request]

    if !(params[:request][:description].blank?)
      session[:search][:description] = params[:request][:description]
      sql_query = "programs.description @@ :description"
      description_programs = @programs.where(sql_query, description: "%#{params[:request][:description]}%")
      sql_query = "programs.title @@ :description"
      title_programs = @programs.where(sql_query, description: "%#{params[:request][:description]}%")
      @programs = description_programs + title_programs
    else
      session[:search][:description] = nil
    end
    if !(params[:request][:category].blank?)
      session[:search][:category] = params[:request][:category]
      sql_query = "programs.category @@ :category"
      @programs = @programs.where(sql_query, category: "#{params[:request][:category]}")
    else
      session[:search][:category] = nil
    end
    if !(params[:request][:max_age].blank?)
      max_age = params[:request][:max_age].to_i
      session[:search][:max_age] = max_age
      sql_query = "programs.max_age <= :max_age"
      @programs = @programs.where(sql_query, max_age: max_age)
    else
      session[:search][:min_age] = nil
    end
    if !(params[:request][:length].blank?)
      session[:search][:length] = params[:request][:length]
      min_length = params[:request][:length].split("-").first.to_i
      max_length = params[:request][:length].split("-").last.to_i
      sql_query = "programs.length >= :min_length AND programs.length < :max_length"
      @programs = @programs.where(sql_query, min_length: min_length, max_length: max_length)
      else
        session[:search][:length] = nil
    end
  end

  def show
    @program = Program.find(params[:id])
    @review = Review.new
    @watching = Watching.find_by_program_id(@program)
    @already_reviewed = @program.already_reviewed?(current_user)
  end
end
