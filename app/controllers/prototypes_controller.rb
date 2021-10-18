class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    # @user = User.find(params[:user_id])
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@user)
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end
end
