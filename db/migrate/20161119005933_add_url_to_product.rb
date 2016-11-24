class AddUrlToProduct < ActiveRecord::Migration
  def change
    add_column :products, :url_photo, :text
  end
end
