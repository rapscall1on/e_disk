class FileEntry < ApplicationRecord
  belongs_to :user
  belongs_to :directory
  has_one_attached :file, dependent: :purge
end
