class LocationsController < ApplicationController
  before_filter :login_required

  # nicked from http://garbageburrito.com/blog/entry/447/rails-super-cool-simple-column-sorting
  def sort_order(default)
    "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
  end

  # GET /locations/occupancies_for
  def occupancies_for
    @locations = Location.find(:all, :conditions => ["active"])

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

    @total_working = @locations.inject(0) do |sum, location|
      if location.working && (location.working.is_a? Integer)
        sum += location.working
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

    @total_school = @locations.inject(0) do |sum, location|
      if location.school && (location.school.is_a? Integer)
        sum += location.school
      else
        sum = sum
      end
    end

  end

  # GET /locations/health_for
  def health_for
    @locations = Location.find(:all, :conditions => ["active"], :order => sort_order('name'))
  end

  # GET /locations/latest_dailies_for
  def latest_dailies_for
    @locations = Location.find(:all, :conditions => ["active"])
  end

  # GET /locations/latest_assessments_for
  def latest_assessments_for
    @locations = Location.find(:all, :conditions => ["active"])
  end

  # GET /locations/all_occupancies_for
  def all_occupancies_for
    @locations = Location.find(:all)
  end

  # GET /locations/all_assessments_for
  def all_assessments_for
    @locations = Location.find(:all)
  end

  # GET /locations/all_dailies_for
  def all_dailies_for
    @locations = Location.find(:all)
  end

  # GET /locations
  def index
    @locations = Location.find(:all, :conditions => ["active"], :order => sort_order('name'))
    
    @total_capacity = @locations.inject(0) do |sum, location|
      sum += location.capacity
    end

    @total_occupancy = @locations.inject(0) do |sum, location|
      sum += location.occupancy
    end
  end

  # GET /locations/activation
  def activation
    @locations = Location.find(:all) # this is when we return active AND inactive locations
  end

  # POST /locations/1/activate
  def activate
    @location = Location.find(params[:id])
    @location.active = !@location.active
    @location.save
    
    @locations = Location.find(:all) # this is when we return active AND inactive locations
    render :action => "activation" 
  end

  # GET /locations/1
  def show
    @location = Location.find(params[:id])
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
  end

  # POST /locations
  def create
    @location = Location.new(params[:location])

      if @location.save
        flash[:notice] = 'Location was successfully created.'
        redirect_to(@location)
      else
        render :action => "new"
      end
  end

  # PUT /locations/1
  def update
    @location = Location.find(params[:id])

      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        redirect_to(@location)
      else
        render :action => "edit"
      end
  end

  # DELETE /locations/1
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to(locations_url)
  end
end
