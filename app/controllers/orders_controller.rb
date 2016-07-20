class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :permisos_admin, only: [:show, :invoices, :validate]

  def permisos_admin
    unless user_signed_in? and current_user.admin == true
      redirect_to 'products'
    end
  end
  
  def add_product
    $id = params[:id]
    $cantidad = params[:cant]

    if session[:cart] then
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
      cart[$id] = $cantidad

    redirect_to '/products'
  end

  # GET /orders
  # GET /orders.json
  def index
    if session[:cart] then
      @cart = session[:cart]
      $cart = @cart

    else
      @cart = {}
    end
  end

  def show
    $id = params[:id]
    @order = Order.find_by_id($id)
  end

  # POST /orders
  # POST /orders.json
  def new
    @compra = current_user.orders.create(productos: session[:cart])
    session[:cart] = {}
    flash[:notice] = "Su pedido fue exitoso, estara en la puerta de su casa en menos de 72 horas"
    redirect_to '/products'
  end

  def invoices
    @facturas = Order.all
  end

  def validate
    $id = params[:id]
    @order = Order.find_by_id($id).update(visto: true)
    redirect_to '/facturas'
  end
end