class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if user_signed_in?
      @orphan_directories = current_user.directories.where(parent_id: nil)
      @orphan_files = current_user.file_entries.where(directory_id: nil)
    end
  end
end