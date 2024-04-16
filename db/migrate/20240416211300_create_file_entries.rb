class CreateFileEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :file_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: true, foreign_key: true
      t.string :name
      t.string :type
      t.integer :size

      t.timestamps
    end
  end
end
