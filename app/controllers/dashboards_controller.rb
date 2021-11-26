class DashboardsController < ApplicationController
  def show
    @accounts = current_user.accounts
  end
end
