class Admin::ReportsController < Admin::ApplicationController
  # GET /email
  def email
    @locations = Location.find(:all)
    @email_content = ""

    for location in @locations
      @email_content += "#{location.id},\"#{ERB::Util.h(location.name)}\",\"#{ERB::Util.h(location.volunteer_summary)}\",\"#{ERB::Util.h(location.provisions_summary)}\"\r\n"
      
    end


    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
