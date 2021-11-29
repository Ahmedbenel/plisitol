class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    @account.user = current_user
    if @account.save
      redirect_to dashboard_path
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url notice: 'Compte supprimé avec succès.' }
    end
  end

  private

  def account_params
    params.require(:account).permit(:platform_id)
  end
end
