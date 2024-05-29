class HomeController < ApplicationController
  def index
    @directories = current_user.directories.where(parent_id: nil)
  end
end
