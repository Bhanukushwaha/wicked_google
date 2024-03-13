class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
   @order = Order.new
  end
  def create
    @order = Order.new(orders_params)
    if @order.save
      redirect_to @order
    else
      render :new, status: :unprocessable_entity
    end
  end
  def generate_report
    @orders = Order.all
    @chart = @orders.group(:category).count.map { |category, count| [category, count] }
    respond_to do |format|
    format.html
      format.pdf do
        render pdf: "generate_report",   # Excluding ".pdf" extension.
        layout: "pdf",
        disposition: 'attachment' # Wait until window.status is equal to this string before rendering page
      end
    end
  end
  private
  def orders_params
    params.require(:order).permit(:title)
  end
end
