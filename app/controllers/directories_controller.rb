class DirectoriesController < ApplicationController
  before_action :set_directory, only: [:show, :edit, :update, :destroy, :move]
  logger = Rails.logger

  # Wyświetlenie wszystkich folderów urzytkownika
  def index
    @directories = current_user.directories
    Rails.logger.info 'Index view accessed'
  end

  # Wyświetlenie szczegółów folderu
  def show
    @directory = Directory.find(params[:id])
    @subdirectories = @directory.directories
    Rails.logger.info 'Show view accessed'

  end

   # Utworzenie nowego folderu
  def new
    @directory = Directory.new(parent_id: params[:parent_id])
    Rails.logger.info 'New view accessed'

  end

  # Zapisanie nowego folderu do bazy
  def create
    @directory = current_user.directories.new(directory_params)
    if @directory.save
      if @directory.parent
        redirect_to @directory.parent, notice: 'Directory was successfully created.'
      else
        redirect_to root_path, notice: 'Directory was successfully created.'
      end
    Rails.logger.info 'Create view accessed'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  # Aktualizacja właściwości folderu
  def update
    @directory = Directory.find(params[:id])
    original_parent = @directory.parent
    if @directory.update(directory_params)
      if original_parent
        redirect_to original_parent, notice: 'Directory was successfully moved.'
      else
        redirect_to root_path, notice: 'Directory was successfully moved.'
      end
    Rails.logger.info "directory has been updated"

    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Usunięcie folderu z bazy
  def destroy
    @directory = Directory.find(params[:id])
    parent_directory = @directory.parent
    @directory.destroy
    Rails.logger.info "directory has been deleted"
    if parent_directory
      redirect_to parent_directory, notice: 'Directory was successfully deleted.'
    else
      redirect_to root_path, notice: 'Directory was successfully deleted.'
    end
  end

  def move
  end

  private

  def set_directory
    @directory = Directory.find(params[:id])
  end

  def directory_params
    params.require(:directory).permit(:name, :parent_id)
  end

end
