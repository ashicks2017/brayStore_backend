class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.string :description
      t.string :category_id
      t.string :img_url
      t.timestamps
    end
  end
end
