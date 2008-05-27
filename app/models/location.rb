class Location < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"
  
  has_many :requests, :order => 'updated_at DESC'
  has_many :occupancies, :order => 'updated_at DESC' do
    def current
      find(:first)
    end
  end

  validates_presence_of :name, :address, :contact, :cell, :capacity
  
  def occupancy
    return 0 unless occupancies.any?
    occupancies.current.quantity
  end
  
  def availability
    capacity - occupancy
  end
  
end