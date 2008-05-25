# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def tz(time_at)
    TzTime.zone.utc_to_local(time_at.utc)
  end
end
