class ChangeLocationBooleansToStrings < ActiveRecord::Migration
  def self.up
    
    add_column :locations, :education_attending_school, :string
    add_column :locations, :education_recreational_activities, :string
    
     Location.find(:all).each do |location|
       if (location.education_children_attending_school)
         location.update_attribute(:education_attending_school, 'true')
       else
         location.update_attribute(:education_attending_school, 'false')
       end

       if (location.education_children_recreational_activities)
         location.update_attribute(:education_recreational_activities, 'true')
       else
         location.update_attribute(:education_recreational_activities, 'false')
       end
      end
      
      remove_column :locations, :education_children_attending_school
      remove_column :locations, :education_children_recreational_activities
    
  end

  def self.down
    add_column :locations, :education_children_attending_school, :string
    add_column :locations, :education_children_recreational_activities, :string
    
     Location.find(:all).each do |location|
       if (location.education_attending_school == 'true')
         location.update_attribute(:education_children_attending_school, true)
       else
         location.update_attribute(:education_children_attending_school, false)
       end

       if (location.education_recreational_activities == 'true')
         location.update_attribute(:education_children_recreational_activities, true)
       else
         location.update_attribute(:education_children_recreational_activities, false)
       end
      end
      
      remove_column :locations, :education_attending_school
      remove_column :locations, :education_recreational_activities
  end
end
