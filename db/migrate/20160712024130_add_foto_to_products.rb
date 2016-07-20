class AddFotoToProducts < ActiveRecord::Migration
  def change
  	add_attachment :products, :foto
  end
end
