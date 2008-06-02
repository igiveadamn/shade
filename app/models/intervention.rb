class Intervention < ActiveRecord::Base
  has_many :requests
  has_many :supplies
end
