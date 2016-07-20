class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :permisos_admin, only: [:new, :create, :edit, :update, :destroy]
    

  def permisos_admin
    unless user_signed_in? and current_user.admin == true
      redirect_to 'products'
    end
  end
  # GET /products
  # GET /products.json
  def index
    @marca = params[:marca]
    @categoria = params[:categoria]
    @ask = params[:ask]

    if @ask
      @products = Product.where("nombre LIKE ?", "%#{@ask}%")
      if @products.presence
        @products
      else
        flash[:notice] = "No se encontro el producto por la referencia #{@ask}."
        redirect_to '/products'
      end
    elsif @marca or @categoria
      @products = Product.where( "marca = '#{@marca}' OR categoria = '#{@categoria}'" )
    else
      @products = Product.all
    end
    @category = CategoryProduct.all
    @branding = BrandingProduct.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:codigo, :nombre, :categoria, :marca, :precio, :foto)
    end
end
