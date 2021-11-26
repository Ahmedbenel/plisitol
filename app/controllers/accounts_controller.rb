class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    @account.user = current_user
    @account.save
    redirect_to dashboard_path(@account)
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
    params.require(:account).permit(:platform)
  end
end
