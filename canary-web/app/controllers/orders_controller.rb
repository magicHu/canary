class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    if current_user
      @orders = Order.where(user_id: current_user.id)
      @orders_unpay = Order.where(user_id: current_user.id, status: "unpay")
    else
      @orders = Order.where(user_id: nil)
      @orders_unpay = Order.where(user_id: nil, status: "unpay")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @room = Room.find(params[:room_id])
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }  
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    room = Room.find(params[:room_id])
    @order = room.orders.build(params[:order])
    @order.user_id = current_user.id if current_user
    @order.price = room.price * @order.room_num
    @order.status = "unpay"

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    #@order.price = room.price * @order.room_num

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel! if @order.may_cancel?
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Order was successfully cancel.' }
      format.json { render json: @order, status: :created, location: @order }
    end
  end

  def pay
    @order = Order.find(params[:id])
    @order.pay! if @order.may_pay?
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Order was successfully pay.' }
      format.json { render json: @order, status: :created, location: @order }
    end
  end
end
