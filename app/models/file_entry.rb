class FileEntry < ApplicationRecord
  belongs_to :user
  belongs_to :folder, optional: true
  belongs_to :disk, optional: true
end
