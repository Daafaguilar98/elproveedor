class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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

  # POST /orders
  # POST /orders.json
  def new
    @compra = current_user.orders.create(productos: session[:cart])
    session[:cart] = {}
    flash[:notice] = "Su pedido fue exitoso, estara en la puerta de su casa en menos de 72 horas"
    redirect_to '/products'
  end
end