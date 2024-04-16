class Disk < ApplicationRecord
  belongs_to :user
  has_many :file_entries, dependent: :destroy
  has_many :folders, dependent: :destroy
end
