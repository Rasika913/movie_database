class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.text :bio
      t.string :photo

      t.timestamps

    end
  end
end
