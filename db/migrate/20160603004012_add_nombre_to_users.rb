class AddNombreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nombre, :string
    add_column :users, :tipoidentificacion, :string
    add_column :users, :numeroidentificacion, :bigint
    add_column :users, :nombreestablecimiento, :string
    add_column :users, :telefono, :bigint
    add_column :users, :celular, :bigint
    add_column :users, :pais, :string
    add_column :users, :ciudad, :string
    add_column :users, :barrio, :string
    add_column :users, :direccion, :string
  end
end
