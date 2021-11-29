class DashboardsController < ApplicationController
  def show
    @accounts = current_user.accounts
    @watchings = current_user.watchings
    @favorites = current_user.favorites
    @children = current_user.children
    @child = Child.new
  end
end
