require "open-uri"

class ChildrenController < ApplicationController
  def new
    @child = Child.new
  end

  def create

    @child = Child.create(children_params)
    @child.photo.attach(io: URI.open("https://res.cloudinary.com/dkeh6owbw/image/upload/v1638457449/development/#{params[:child][:image_url]}.png"), filename: 'avatar.png', content_type: 'image/png')
    @child.user = current_user
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
