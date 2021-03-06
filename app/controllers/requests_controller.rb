class RequestsController < ApplicationController

  before_filter :login_required
  before_filter :find_location, :only => [:new, :create]

  # nicked from http://garbageburrito.com/blog/entry/447/rails-super-cool-simple-column-sorting
  def sort_order(default)
    "#{(params[:c] || default.to_s).gsub(/[\s;'\"]/,'')} #{params[:d] == 'down' ? 'DESC' : 'ASC'}"
  end

  # GET /requests
  # GET /requests.xml
  def index
    @local_requests = Request.find(:all, :conditions => "status <> 'closed'", :order => sort_order('location_id')).collect! { |request| Integer(request.location.region.id) == Integer(session[:region]) ? request : nil }.compact
    @other_requests = Request.find(:all, :conditions => "status <> 'closed'", :order => sort_order('location_id')).collect! { |request| Integer(request.location.region.id) != Integer(session[:region]) ? request : nil }.compact
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end
  
  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
    @location = @request.location
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])
    @request.location = @location

    respond_to do |format|
      if @request.save
        flash[:notice] = 'Request was successfully created.'
        format.html { redirect_to(@location) }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])
    @location = @request.location

    respond_to do |format|
      if @request.update_attributes(params[:request])
        flash[:notice] = 'Request was successfully updated.'
        format.html { redirect_to(params[:redirect_to] || @request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to(requests_url) }
      format.xml  { head :ok }
    end
  end

  # POST /requests/1/busy
  def busy
    handle_status_change "Busy", "Request was successfully assigned to #{current_user.name}."
  end

  # POST /requests/1/closed
  def closed
    handle_status_change "Closed", "Request was successfully closed."
  end
  
  private
    def handle_status_change(new_status, success_message)
      @request = Request.find(params[:id])
      @request.status = new_status # See Request model for options
      @request.save
      flash[:notice] = success_message
      redirect_to params[:redirect_to] || location_path(@request.location)
    end

    def find_location
      @location = Location.find(params[:location_id])
    end
end
