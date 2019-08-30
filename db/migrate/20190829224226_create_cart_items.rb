class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.string :shopping_cart
      t.string :item_id
      t.timestamps
    end
  end
end
