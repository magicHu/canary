class RoomResourcesController < ApplicationController
  # GET /room_resources
  # GET /room_resources.json
  def index
    @room_resources = RoomResource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @room_resources }
    end
  end

  # GET /room_resources/1
  # GET /room_resources/1.json
  def show
    @room_resource = RoomResource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @room_resource }
    end
  end

  # GET /room_resources/new
  # GET /room_resources/new.json
  def new
    @room_resource = RoomResource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @room_resource }
    end
  end

  # GET /room_resources/1/edit
  def edit
    @room_resource = RoomResource.find(params[:id])
  end

  # POST /room_resources
  # POST /room_resources.json
  def create
    @room_resource = RoomResource.new(params[:room_resource])

    respond_to do |format|
      if @room_resource.save
        format.html { redirect_to @room_resource, notice: 'Room resource was successfully created.' }
        format.json { render json: @room_resource, status: :created, location: @room_resource }
      else
        format.html { render action: "new" }
        format.json { render json: @room_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /room_resources/1
  # PUT /room_resources/1.json
  def update
    @room_resource = RoomResource.find(params[:id])

    respond_to do |format|
      if @room_resource.update_attributes(params[:room_resource])
        format.html { redirect_to @room_resource, notice: 'Room resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @room_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_resources/1
  # DELETE /room_resources/1.json
  def destroy
    @room_resource = RoomResource.find(params[:id])
    @room_resource.destroy

    respond_to do |format|
      format.html { redirect_to room_resources_url }
      format.json { head :no_content }
    end
  end
end
