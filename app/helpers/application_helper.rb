# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tz(time_at)
    TzTime.zone.utc_to_local(time_at.utc)
  end

  # nicked from http://garbageburrito.com/blog/entry/447/rails-super-cool-simple-column-sorting
  def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    link_to_unless condition, title, request.parameters.merge( {:c => column, :d => sort_dir} )
  end

 
  
end
