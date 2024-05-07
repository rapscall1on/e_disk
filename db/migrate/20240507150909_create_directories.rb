class CreateDirectories < ActiveRecord::Migration[7.1]
  def change
    create_table :directories do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :parent_id
      t.string :name

      t.timestamps
    end
  end
end
