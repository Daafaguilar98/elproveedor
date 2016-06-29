class CategoryProductsController < ApplicationController
  def nuevocategoria

	@categoria = params[:categoria]
	CategoryProduct.create(categoria: @categoria)
	redirect_to new_product_path

  end
end
