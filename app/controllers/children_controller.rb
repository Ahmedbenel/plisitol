class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.create(children_params)
    @child.user = current_user
    if @child.save
      redirect_to dashboard_path
    else
      render 'children/new'
    end
  end

  private

  def children_params
    params.require(:child).permit(:name, :age, :image_url)
  end
end
