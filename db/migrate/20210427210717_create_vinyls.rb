class CreateVinyls < ActiveRecord::Migration[5.2]
  def change
    create_table :vinyls do |t|
      t.string :title
      t.string :artist
      t.string :genre
      t.integer :release_year
      t.integer :user_id
    end
  end
end
