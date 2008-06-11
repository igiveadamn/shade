class DailiesController < ApplicationController
  before_filter :login_required
  before_filter :find_location, :only => [:index, :new, :create]

  # GET /dailies
  # GET /dailies.xml
  def index
    @dailies = @location.dailies

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dailies }
    end
  end

  # GET /dailies/new
  # GET /dailies/new.xml
  def new
    @daily = Daily.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @daily }
    end
  end

  # POST /dailies
  # POST /dailies.xml
  def create
    @daily = Daily.new(params[:daily])
    @daily.location = @location

    respond_to do |format|
      if @daily.save
        flash[:notice] = 'Daily Health Assessment was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @daily, :status => :created, :location => @daily }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @daily.errors, :status => :unprocessable_entity }
      end
    end
  end
  
private

  def find_location
    @location = Location.find(params[:location_id])
  end
end
