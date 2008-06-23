class AssessmentsController < ApplicationController
    before_filter :login_required
    before_filter :find_location, :only => [:index, :new, :create]

    # GET /assessments
    # GET /assessments.xml
    def index
      @assessments = @location.assessments

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @assessments }
      end
    end

    # GET /assessments/new
    # GET /assessments/new.xml
    def new
      @assessment = Assessment.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @assessment }
      end
    end

    # POST /assessments
    # POST /assessments.xml
    def create
      @assessment = Assessment.new(params[:assessment])
      @assessment.location = @location

      respond_to do |format|
        if @assessment.save
          flash[:notice] = 'Follow Up Health Assessment was successfully created.'
          format.html { redirect_to(@location) }
          format.xml  { render :xml => @assessment, :status => :created, :location => @assessment }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @assessment.errors, :status => :unprocessable_entity }
        end
      end
    end

  private

    def find_location
      @location = Location.find(params[:location_id])
    end
  end
