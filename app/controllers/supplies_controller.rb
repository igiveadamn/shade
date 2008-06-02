class SuppliesController < ApplicationController

  before_filter :login_required
  before_filter :find_depot, :only => [:new, :create]

  # nicked from http://garbageburrito.com/blog/entry/447/rails-super-cool-simple-column-sorting
  def sort_order(default)
    "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
  end

  # GET /supplies
  # GET /supplies.xml
  def index
    @supplies = Supply.find(:all, :conditions => "status = 'Open'")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supplies }
    end
  end

  # GET /supplies/1
  # GET /supplies/1.xml
  def show
    @supply = Supply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supply }
    end
  end

  # GET /supplies/new
  # GET /supplies/new.xml
  def new
    @supply = Supply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supply }
    end
  end

  # GET /supplies/1/edit
  def edit
    @supply = Supply.find(params[:id])
    @depot = @supply.depot
  end

  # POST /supplies
  # POST /supplies.xml
  def create
    @supply = Supply.new(params[:supply])
    @supply.depot = @depot
    
    respond_to do |format|
      if @supply.save
        flash[:notice] = 'Supply was successfully created.'
        format.html { redirect_to(@depot) }
        format.xml  { render :xml => @supply, :status => :created, :location => @supply }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supplies/1
  # PUT /supplies/1.xml
  def update
    @supply = Supply.find(params[:id])

    respond_to do |format|
      if @supply.update_attributes(params[:supply])
        flash[:notice] = 'Supply was successfully updated.'
        format.html { redirect_to(@supply) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supplies/1
  # DELETE /supplies/1.xml
  def destroy
    @supply = Supply.find(params[:id])
    @supply.destroy

    respond_to do |format|
      format.html { redirect_to(supplies_url) }
      format.xml  { head :ok }
    end
  end
  
  # POST /requests/1/closed
  def closed
    @supply = Supply.find(params[:id])
    @supply.status = "Closed" # See Request model for options
    @supply.save
    redirect_to depot_path(@supply.depot)
  end
  
  private

  def find_depot
    @depot = Depot.find(params[:depot_id])
  end
  
end
