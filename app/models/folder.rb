class Folder < ApplicationRecord
  belongs_to :user
  belongs_to :disk, optional: true
  belongs_to :parent, class_name: 'Folder', optional: true
  has_many :file_entries, dependent: :destroy
  has_many :child_folders, class_name: 'Folder', foreign_key: 'parent_id', dependent: :destroy
end
