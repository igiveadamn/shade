class LocationsController < ApplicationController
  before_filter :login_required

  # nicked from http://garbageburrito.com/blog/entry/447/rails-super-cool-simple-column-sorting
  def sort_order(default)
    "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
  end

  # GET /locations/occupancies_for
  # GET /locations/occupancies_for.xml
  def occupancies_for
    @locations = Location.find(:all)
    @local_locations = Location.find(:all, :order => sort_order('name')).collect! { |location| Integer(location.region.id) == Integer(session[:region]) ? location : nil }.compact
    @other_locations = Location.find(:all, :order => sort_order('name')).collect! { |location| Integer(location.region.id) != Integer(session[:region]) ? location : nil }.compact

    @total_occupancy = @locations.inject(0) do |sum, location|
      sum += location.occupancy
    end

    @total_men = @locations.inject(0) do |sum, location|
      sum += location.men
    end

    @total_women = @locations.inject(0) do |sum, location|
      sum += location.women
    end

    @total_children = @locations.inject(0) do |sum, location|
      sum += location.children
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.find(:all)
    @local_locations = Location.find(:all).collect! { |location| Integer(location.region.id) == Integer(session[:region]) ? location : nil }.compact
    @other_locations = Location.find(:all).collect! { |location| Integer(location.region.id) != Integer(session[:region]) ? location : nil }.compact
    
    @total_capacity = @locations.inject(0) do |sum, location|
      sum += location.capacity
    end

    @total_occupancy = @locations.inject(0) do |sum, location|
      sum += location.occupancy
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
