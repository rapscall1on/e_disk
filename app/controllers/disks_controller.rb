class DisksController < ApplicationController
  def index
    @disks = Disk.all
  end
  
  def show 
    @disk = Disk.find(params[:id])
    @folders = @disk.folders
  end
end
