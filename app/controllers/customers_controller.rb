class CustomersController < ApplicationController
    skip_before_action :check_authentication, only: [:create, :cart_items]
  
  def index
    customers = Customer.all 
    render json: customers
  end
  
  
  def show
    customer = Customer.find(params[:id])
    render json: customer
  end
  
  
  def delete_customer
    customer = Customer.find(params[:id])
    customer.destroy
    render json: { status: 200, msg: "Customer has been deleted." }
  end
  
  
    #sign up
  def create
    byebug
  customer = Customer.create(customer_params)
  render json: {
    customer: customer,
    token: encode_token({ customer_id: customer.id })
  }
  end
  
  
  def profile
      render json: current_customer
   end
  
  def cart_items
    # byebug
    @customer = Customer.find(params[:id])
   @cart = @customer.shopping_cart
  
    @items = @cart.cart_items.map do |item|
      Item.find(item.id)
    end
  
    # @item = Item.find(params[:id])
  
    render json: {items: @items}
  end
  
  def delete_item
    puts "deleting item"
    # byebug
    @customer = Customer.find(params[:id])
  
    @cart = @customer.shopping_cart
    @items = @cart.items
    @items.destroy
    render json: { status: 200, msg: "Item has been deleted." }
  end
  
  
  private
  def customer_params
    params.permit(:name, :email, :address, :password)
  end
  
  end