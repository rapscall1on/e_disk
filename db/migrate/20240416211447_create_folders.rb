class CreateFolders < ActiveRecord::Migration[7.1]
  def change
    create_table :folders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :disk, null: true, foreign_key: true
      t.references :parent, null: true, foreign_key: { to_table: :folders }
      t.string :name

      t.timestamps
    end
  end
end
