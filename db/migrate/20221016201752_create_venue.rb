class CreateVenue < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :main_sport
      t.integer :max_capacity
      t.boolean :dome
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
