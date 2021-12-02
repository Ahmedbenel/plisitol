class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_session

  def init_session
    session[:search] = {} if session[:search].nil?
  end
end
