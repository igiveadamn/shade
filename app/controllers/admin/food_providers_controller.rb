class Admin::FoodProvidersController < ApplicationController

  before_filter :login_required

  # GET /food_providers
  # GET /food_providers.xml
  def index
    @food_providers = FoodProvider.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @food_providers }
    end
  end

  # GET /food_providers/1
  # GET /food_providers/1.xml
  def show
    @food_provider = FoodProvider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @food_provider }
    end
  end

  # GET /food_providers/new
  # GET /food_providers/new.xml
  def new
    @food_provider = FoodProvider.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @food_provider }
    end
  end

  # GET /food_providers/1/edit
  def edit
    @food_provider = FoodProvider.find(params[:id])
  end

  # POST /food_providers
  # POST /food_providers.xml
  def create
    @food_provider = FoodProvider.new(params[:food_provider])

    respond_to do |format|
      if @food_provider.save
        flash[:notice] = 'FoodProvider was successfully created.'
        format.html { redirect_to admin_food_providers_path }
        format.xml  { render :xml => @food_provider, :status => :created, :location => @food_provider }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @food_provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /food_providers/1
  # PUT /food_providers/1.xml
  def update
    @food_provider = FoodProvider.find(params[:id])

    respond_to do |format|
      if @food_provider.update_attributes(params[:food_provider])
        flash[:notice] = 'FoodProvider was successfully updated.'
        format.html { redirect_to admin_food_providers_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @food_provider.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /food_providers/1
  # DELETE /food_providers/1.xml
  def destroy
    @food_provider = FoodProvider.find(params[:id])
    @food_provider.destroy

    respond_to do |format|
      format.html { redirect_to admin_food_providers_path }
      format.xml  { head :ok }
    end
  end
end
