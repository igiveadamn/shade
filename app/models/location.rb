class Location < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"
  belongs_to :user # the user responsible for updating the details regularly
  belongs_to :location_type
  belongs_to :depot
  belongs_to :region
  
  has_many :requests, :order => 'updated_at DESC', :conditions => ["status <> 'closed'"]

  has_many :occupancies, :order => 'created_at DESC' do
    def current
      find(:first)
    end
  end

  has_many :dailies, :order => 'created_at DESC' do
    def current
      find(:first)
    end
  end

  has_many :assessments, :order => 'created_at DESC' do
    def current
      find(:first)
    end
  end

  validates_presence_of :name, :address, :contact, :cell, :capacity, :region
  validates_numericality_of :capacity, :greater_than_or_equal_to => 0, :only_integer => true

  def active
    if (value = read_attribute(:active)).nil? then true else value end
  end

  TRUE_FALSE_NA = %w(true false N/A)
  SHELTER_TYPES = %w(Tents Brick Prefabricated Other)
  WATER_SOURCES = %w(Tap Containers Other)
  REFUSE_STORAGE = %w(Sealed\ bins Open\ bins\ or\ pit No\ refuse\ storage\ system)
  REFUSE_REMOVAL = %w(Removal\ adequate Removal\ inadequate No\ refuse\ removal\ system)
  SECURITY = %w(None Less\ than\ 24\ hours 24\ hours)
  HEALTH_FREQUENCY = %w(On\ site\ daily On\ site\ less\ than\ daily Referral\ only)

  
  def occupancy
    return 0 unless occupancies.any?
    occupancies.current.quantity
  end
  
  def men
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.men
    return occupancies.current.men
  end
  
  def women
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.women
    return occupancies.current.women
  end
  
  def pregnant
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.pregnant
    return occupancies.current.pregnant
  end
  
  def babies
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.babies
    return occupancies.current.babies
  end
  
  def chronic_medication
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.chronic_medication
    return occupancies.current.chronic_medication
  end
  
  def children
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.children
    return occupancies.current.children
  end
  
  def working
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.working
    return occupancies.current.working
  end
  
  def school
    return "unknown" unless occupancies.any?
    return "unknown" unless occupancies.current.school
    return occupancies.current.school
  end
  
  def availability
    capacity - occupancy
  end
  
end