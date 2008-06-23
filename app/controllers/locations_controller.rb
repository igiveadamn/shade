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

    @total_occupancy = @locations.inject(0) do |sum, location|
      sum += location.occupancy
    end

    @total_men = @locations.inject(0) do |sum, location|
      if location.men && (location.men.is_a? Integer)
        sum += location.men
      else
        sum = sum
      end
    end

    @total_women = @locations.inject(0) do |sum, location|
      if location.women && (location.women.is_a? Integer)
        sum += location.women
      else
        sum = sum
      end
    end

    @total_pregnant = @locations.inject(0) do |sum, location|
      if location.pregnant && (location.pregnant.is_a? Integer)
        sum += location.pregnant
      else
        sum = sum
      end
    end

    @total_chronic_medication = @locations.inject(0) do |sum, location|
      if location.chronic_medication && (location.chronic_medication.is_a? Integer)
        sum += location.chronic_medication
      else
        sum = sum
      end
    end

    @total_children = @locations.inject(0) do |sum, location|
      if location.children && (location.children.is_a? Integer)
        sum += location.children
      else
        sum = sum
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/health_for
  # GET /locations/health_for.xml
  def health_for
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/latest_dailies_for
  # GET /locations/latest_dailies_for.xml
  def latest_dailies_for
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/latest_assessments_for
  # GET /locations/latest_assessments_for.xml
  def latest_assessments_for
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations
  # GET /locations.xml
  def index
    @locations = Location.find(:all)
    
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
