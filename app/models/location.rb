class Location < ActiveRecord::Base
  belongs_to :last_updated_user, :class_name => 'User', :foreign_key => 'last_updated_user_id'
  has_many :requests
  has_many :availabilities, :class_name => 'LocationAvailability', :order => 'updated_at'
  
  def availability
    return 0 unless availabilities.any?
    availabilities.last.availability
  end
  
  def availability_comments
    return unless availabilities.any?
    availabilities.last.comments
  end
end