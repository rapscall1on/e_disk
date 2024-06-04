class FileEntry < ApplicationRecord
  belongs_to :user
  belongs_to :directory, optional: true
  has_one_attached :file, dependent: :purge
  #  validates :name, uniqueness: { scope: :directory_id, message: "File with this name already exists in the directory" }

end