class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    add_values(@order)
    #@order.work_place_range = params[:work_place_range]
    #@order.work_type = params[:work_type]
    #@order.car_type = params[:car_type]
    #@order.user_id = params[:user_id]
    #@order.loading_work = params[:loading_work]
      binding.pry
    if @order.save
    else
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

    def order_params
      params.require(:order).permit(:work_place_range, :work_place ,:start_date,:finish_date, :work_type, :loading_work, :car_type, :attention)
    end

    def add_values(order)
      order.work_place_range = params[:work_place_range]
      order.work_type = params[:work_type]
      order.car_type = params[:car_type]
      order.loading_work = params[:loading_work]
      order.user_id = params[:user_id]
    end
end
