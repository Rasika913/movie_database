class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.text :bio
      t.text :trivia

      t.timestamps

    end
  end
end
