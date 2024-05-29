class DirectoriesController < ApplicationController
  before_action :set_directory, only: [:show, :edit, :update, :destroy, :move]
  def index
    @directories = Directory.all
  end

  def show
  end

  def new
    @directory = Directory.new
  end

  def create
    @directory = Directory.new(directory_params)
    @directory.user = current_user
    if @directory.save
      redirect_to @directory, notice: 'Directory entry was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @directory.update(directory_params)
      redirect_to @directory, notice: 'Directory entry was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @directory.destroy
    redirect_to directories_path, notice: 'File entry was successfully destroyed.'
  end

  def move
  end

  private

  def set_directory
    @directory = Directory.find(params[:id])
  end

  def directory_params
    params.require(:directory).permit(:name,:user_id,:parent_id)
  end

end
