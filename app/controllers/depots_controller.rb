class DepotsController < ApplicationController
  # GET /depots
  # GET /depots.xml
  def index
    @depots = Depot.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @depots }
    end
  end

  # GET /depots/1
  # GET /depots/1.xml
  def show
    @depot = Depot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @depot }
    end
  end

  # GET /depots/new
  # GET /depots/new.xml
  def new
    @depot = Depot.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @depot }
    end
  end

  # GET /depots/1/edit
  def edit
    @depot = Depot.find(params[:id])
  end

  # POST /depots
  # POST /depots.xml
  def create
    @depot = Depot.new(params[:depot])

    respond_to do |format|
      if @depot.save
        flash[:notice] = 'Depot was successfully created.'
        format.html { redirect_to(@depot) }
        format.xml  { render :xml => @depot, :status => :created, :location => @depot }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @depot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /depots/1
  # PUT /depots/1.xml
  def update
    @depot = Depot.find(params[:id])

    respond_to do |format|
      if @depot.update_attributes(params[:depot])
        flash[:notice] = 'Depot was successfully updated.'
        format.html { redirect_to(@depot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @depot.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /depots/1
  # DELETE /depots/1.xml
  def destroy
    @depot = Depot.find(params[:id])
    @depot.destroy

    respond_to do |format|
      format.html { redirect_to(depots_url) }
      format.xml  { head :ok }
    end
  end
end
