class FileEntriesController < ApplicationController
  before_action :set_file_entry, only: [:show, :edit, :update, :destroy, :move]
  def index
    @file_entries = FileEntry.all
  end

  def new
    @directory = params[:directory_id] ? Directory.find(params[:directory_id]) : nil
    @file_entry = FileEntry.new
  end

  def create
    @directory = params[:directory_id] ? Directory.find(params[:directory_id]) : nil
    @file_entry = @directory ? @directory.file_entries.build(file_params) : FileEntry.new(file_params)
    @file_entry.user = current_user

    if @file_entry.save
      flash[:notice] = 'File was successfully uploaded.'
      redirect_to @directory ? @directory : root_path
    else
      render :new
    end
  end

  def edit
  end


  def update
    if @file_entry.update(file_entry_params)
      if params[:file_entry][:name].present?
        old_file = @file_entry.file.download
        old_extension = File.extname(@file_entry.file.filename.to_s)
        new_name = params[:file_entry][:name]

        # Append the old extension if the new name doesn't have an extension
        unless File.extname(new_name).present?
          new_name += old_extension
        end

        @file_entry.file.attach(io: StringIO.new(old_file), filename: new_name, content_type: @file_entry.file.content_type)
      end
      redirect_to @file_entry.directory ? @file_entry.directory : root_path, notice: 'File entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    directory = @file_entry.directory
    @file_entry.file.purge
    @file_entry.destroy
    redirect_to directory ? directory : root_path, notice: 'File entry was successfully destroyed.'
  end

  def move
    # @file_entry = FileEntry.find(params[:id])
  
    # @file_entry.update(file_entry_params)
    # redirect_to file_entries_index_path, notice: 'File entry was successfully moved.'
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
    params.require(:file_entry).permit(:user_id, :directory_id, :file, :name)
  end

  def file_params
    params.require(:file_entry).permit(:file, :filename)
  end

end
