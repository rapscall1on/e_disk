class FileEntriesController < ApplicationController
  before_action :set_file_entry, only: [:show, :edit, :update, :destroy]
  def index
    @file_entries = FileEntry.all
  end

  def new
    @file_entry = FileEntry.new
  end

  def show
  end

  def create
    @file_entry = FileEntry.new(file_entry_params)
    @file_entry.user = current_user
    @file_entry.directory = Directory.find(params[:directory_id])

    if @file_entry.save
      redirect_to @file_entry, notice: 'File entry was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  
  def update
    if @file_entry.file.update(file_entry_params)
      redirect_to @file_entry, notice: 'File entry was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @file_entry.file.purge
    @file_entry.destroy
    redirect_to file_entries_index_path, notice: 'File entry was successfully destroyed.'
  end

  def download
  end

  def share
  end

  private

  def set_file_entry
    @file_entry = FileEntry.find(params[:id])
  end

  def file_entry_params
    params.require(:file_entry).permit(:file,:filename,:user_id,:directory_id)
  end

end
