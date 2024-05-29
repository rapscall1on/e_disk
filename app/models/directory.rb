class Directory < ApplicationRecord
  belongs_to :user
  has_many :file_entries, dependent: :destroy
  has_many :directories, foreign_key: "parent_id", class_name: "Directory"
  belongs_to :parent, class_name: "Directory", optional: true
end