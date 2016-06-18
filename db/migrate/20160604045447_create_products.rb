class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.bigint :codigo
      t.string :nombre
      t.string :categoria
      t.string :marca
      t.integer :precio

      t.timestamps null: false
    end
  end
end
