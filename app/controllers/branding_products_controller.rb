class BrandingProductsController < ApplicationController
  def nuevomarca

	@marca = params[:marca]
	BrandingProduct.create(marca: @marca)
	redirect_to new_product_path

  end
end
