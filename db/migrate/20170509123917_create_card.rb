class CreateCard < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :id, primary: true
      t.string :name
      t.string :number
      t.string :type
      t.string :rarity
    end
  end
end
