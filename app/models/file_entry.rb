class FileEntry < ApplicationRecord
  belongs_to :user
  belongs_to :directory
end
