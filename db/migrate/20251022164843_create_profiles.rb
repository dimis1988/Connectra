class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :username
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :profiles, :username, unique: true
  end
end
