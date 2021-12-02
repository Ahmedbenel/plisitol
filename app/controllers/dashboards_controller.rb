class DashboardsController < ApplicationController
  def show
    @accounts = current_user.accounts
    @platforms = current_user.platforms
    @watchings = current_user.watchings
    @favorites = current_user.favorites
    @children = current_user.children
    @child = Child.new
    @account = Account.new
    # @data_child = @children.first.calculate_cw_all_categories
    # @line_data_child = @children.calculate_cw_all_dates
  end
end
