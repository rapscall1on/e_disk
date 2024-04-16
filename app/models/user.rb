class User < ApplicationRecord
  has_secure_password
  has_many :folders, dependent: :destroy
  has_many :file_entries, dependent: :destroy
  has_many :disks, dependent: :destroy
end
