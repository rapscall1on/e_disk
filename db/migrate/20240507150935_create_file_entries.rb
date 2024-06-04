class CreateFileEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :file_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :directory, null: true, foreign_key: true
      t.string :name
      t.string :file_type
      t.integer :file_size

      t.timestamps
    end
  end
end
