class CreateBrandingProducts < ActiveRecord::Migration
  def change
    create_table :branding_products do |t|
      t.string :marca

      t.timestamps null: false
    end
  end
end
