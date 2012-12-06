class BannersController < ApplicationController
  # GET /banners
  # GET /banners.json
  def index
    @banners_onshelf = Banner.all_onshelf
    @banners_offshelf = Banner.all_offshelf

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    @banner = Banner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/new
  # GET /banners/new.json
  def new
    @banner = Banner.new
    @banner.build_attachment

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @banner }
    end
  end

  # GET /banners/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banners
  # POST /banners.json
  def create
    @banner = Banner.new(params[:banner])

    respond_to do |format|
      if @banner.save
        format.html { redirect_to @banner, notice: 'Banner was successfully created.' }
        format.json { render json: @banner, status: :created, location: @banner }
      else
        format.html { render action: "new" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /banners/1
  # PUT /banners/1.json
  def update
    @banner = Banner.find(params[:id])

    respond_to do |format|
      if @banner.update_attributes(params[:banner])
        format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @banner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banners/1
  # DELETE /banners/1.json
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy

    respond_to do |format|
      format.html { redirect_to banners_url }
      format.json { head :no_content }
    end
  end
  
  # PUT /banner/1/up
  def up
    @banner = Banner.find(params[:id])
    @banner.move_higher
    
    respond_to do |format|
      format.html { redirect_to banners_url, notice: "Banner #{@banner.title} was successfully moved." }
    end
  end
  
  # PUT /baaner/1/down
  def down
    @banner = Banner.find(params[:id])
    @banner.move_lower
    
    respond_to do |format|
      format.html { redirect_to banners_url, notice: "Banner #{@banner.title} position was successfully moved." }
    end
  end

  def onshelf
    @banner = Banner.find(params[:id])
    @banner.on_shelf! if @banner.may_on_shelf?

    respond_to do |format|
      format.html { redirect_to banners_url, notice: "Banner #{@banner.title} was successfully onshelf." }
    end
  end

  def offshelf
    @banner = Banner.find(params[:id])
    @banner.off_shelf! if @banner.may_off_shelf?

    respond_to do |format|
      format.html { redirect_to banners_url, notice: "Banner #{@banner.title} was successfully offshelf." }
    end
  end
end
