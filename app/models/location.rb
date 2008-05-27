class Location < ActiveRecord::Base
  belongs_to :last_updated_user, :class_name => 'User', :foreign_key => 'last_updated_user_id'
  has_many :requests
end