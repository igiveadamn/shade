class OccupanciesController < ApplicationController
  before_filter :login_required
  before_filter :find_location, :only => [:index, :new, :create]
  
  # GET /occupancies
  # GET /occupancies.xml
  def index
    @occupancies = @location.occupancies

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @occupancies }
    end
  end

  # GET /occupancies/new
  # GET /occupancies/new.xml
  def new
    @occupancy = Occupancy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @occupancy }
    end
  end

  # POST /occupancies
  # POST /occupancies.xml
  def create
    @occupancy = Occupancy.new(params[:occupancy])
    @occupancy.location = @location
    
    respond_to do |format|
      if @occupancy.save
        flash[:notice] = 'Occupancy was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @occupancy, :status => :created, :location => @occupancy }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @occupancy.errors, :status => :unprocessable_entity }
      end
    end
  end

private

  def find_location
    @location = Location.find(params[:location_id])
  end
end
