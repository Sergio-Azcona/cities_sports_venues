class CreateCity < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :pro_teams
      t.boolean :multiple_venues

      t.timestamps
    end
  end
end
