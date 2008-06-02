class MyTasksController < ApplicationController
  def index
    @requests = current_user.open_tasks
    respond_to do |format|
      format.html
      format.xml  { render :xml => @requests }
    end
  end
end
