# Active Records will automatically record the user who created and/or updated a database objects
# if fields of the names created_by/created_by are present.
#
# This module requires that your user object (which by default is <tt>User</tt> but can be changed
# using the <tt>user_model_name</tt> method) contains an accessor called <tt>current_user</tt> and
# is set with the instance of the currently logged in user (typically using a <tt>before_filter</tt> and the
# session.
#
# Options can be change globally or at the class level.  Example
#
#  class ActiveRecord::Base
#    include Userstamp
#  end
#
#  class User < ActiveRecord::Base
#    cattr_accessor :current_user
#  end
#
#  class Entry < ActiveRecord::Base
#    belongs_to :created_user, :class_name => "User", :foreign_key => "created_user"
#    belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user"
#    
#    created_by_attr :created_user
#    updated_by_attr :updated_user
#  end
#
#  class Post < ActiveRecord::Base
#    record_userstamps = false
#  end
#
# ==== Options
# user_model_name:: user
# created_by_attr:: created_by_id
# updated_by_attr:: updated_by_id
#

module Userstamp
  def self.included(base)
    super
    
    base.extend ClassMethods
    base.class_eval do
      include InstanceMethods
      before_create :set_create_userstamp
      before_update :set_update_userstamp
      
      class_inheritable_accessor :record_userstamp, :user_model_name, :created_by_attr, :updated_by_attr

      # Setting defaults
      self.record_userstamp = true
      self.user_model_name = :user
      self.created_by_attr = :created_by
      self.updated_by_attr = :updated_by
    end      
  end

  module ClassMethods
    def set_user_model_name(name)
      self.user_model_name = name
    end
  end

  module InstanceMethods
    def user_model
      user_model_name.to_s.classify.constantize
    end
    
    def set_create_userstamp
      if record_userstamp && user_model.current_user
        self[created_by_attr] = user_model.current_user.id if respond_to?(created_by_attr)
      end
    end
    
    def set_update_userstamp
      if record_userstamp && user_model.current_user
        self[updated_by_attr] = user_model.current_user.id if respond_to?(updated_by_attr)
      end
    end
  end
end