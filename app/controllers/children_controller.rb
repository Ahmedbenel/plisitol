class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create
    @child = Child.create(children_params)
    @child.user = current_user
    @child.photo.attach(children_params[:image_url])
    if @child.save
      redirect_to dashboard_path
    else
      render "children/new"
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to dashboard_path
  end

  private

  def children_params
    params.require(:child).permit(:name, :age, :image_url)
  end
end
