class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrates
      t.integer :calorie

      t.timestamps
    end
  end
end
