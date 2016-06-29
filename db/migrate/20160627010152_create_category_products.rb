class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|
      t.string :categoria

      t.timestamps null: false
    end
  end
end
