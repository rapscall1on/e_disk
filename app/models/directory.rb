class Directory < ApplicationRecord
  belongs_to :user
  has_many :file_entries, dependent: :destroy
  has_many :directories, foreign_key: "parent_id", class_name: "Directory", dependent: :destroy
  belongs_to :parent, class_name: "Directory", optional: true

  validates :name, uniqueness: { scope: :parent_id, message: "already exists in the same parent directory" }

  def ancestors
    parent ? [parent] + parent.ancestors : []
  end

  def descendants
    directories.map do |directory|
      [directory] + directory.descendants
    end.flatten
  end

  def self.all_except(directories)
    directories = Array(directories).flatten
    where.not(id: directories.map(&:id) + directories.map { |d| d.descendants.map(&:id) }.flatten)
  end

  def full_path
    ancestors.reverse.map(&:name).push(name).join('/')
  end

end