class ReportsController < Admin::ApplicationController
  # GET /depots_and_locations
  def depots_and_locations
    @depots = Depot.find(:all, :conditions => ["goods_summary <> ''"])
    @locations = Location.find(:all, :conditions => ["volunteer_summary <> ''"])
    @rows = Array.new

    for depot in @depots
      fields = Array.new
      fields.push prepare("depot")
      fields.push prepare(depot.id)
      fields.push prepare(depot.name)
      fields.push prepare(depot.address)
      fields.push prepare(depot.driving_directions)
      fields.push prepare(depot.goods_contact)
      fields.push prepare(depot.goods_cell)
      
      @rows.push fields
    end

    for location in @locations
      fields = Array.new
      fields.push prepare("location")
      fields.push prepare(location.id)
      fields.push prepare(location.name)
      fields.push prepare(location.address)
      fields.push prepare(location.driving_directions)
      fields.push prepare(location.volunteer_contact)
      fields.push prepare(location.volunteer_cell)

      @rows.push fields
    end

    respond_to do |format|
      format.html { render :template => "reports/email"  }
    end
  end

  # GET /content
  def content
    @depots = Depot.find(:all, :conditions => ["goods_summary <> ''"])
    @locations = Location.find(:all, :conditions => ["volunteer_summary <> ''"])
    @rows = Array.new

    for depot in @depots
      fields = Array.new
      fields.push prepare("depot")
      fields.push prepare(depot.id)
      fields.push prepare(depot.name)
      fields.push prepare(depot.goods_summary)
      
      @rows.push fields
    end

    for location in @locations
      fields = Array.new
      fields.push prepare("location")
      fields.push prepare(location.id)
      fields.push prepare(location.name)
      fields.push prepare(location.volunteer_summary)

      @rows.push fields
    end

    respond_to do |format|
      format.html { render :template => "reports/email"  }
    end
  end

  private
  def prepare(value)
    value
  end
end
