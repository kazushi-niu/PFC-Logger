class AddImgToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :img, :string
  end
end
