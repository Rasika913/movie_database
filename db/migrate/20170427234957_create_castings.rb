class CreateCastings < ActiveRecord::Migration
  def change
    create_table :castings do |t|
      t.string :character
      t.integer :movie_id

      t.timestamps

    end
  end
end
