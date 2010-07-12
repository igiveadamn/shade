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
      @previous = @location.assessments.current
      @assessment = Assessment.new

      if @previous
        #copy all attributes (except id) to the new assessment. this will result in prepopulation of the form
        @previous.attributes.each do |key, value|
          next if key == "id"
          @assessment.write_attribute(key, value)
        end
      end

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
