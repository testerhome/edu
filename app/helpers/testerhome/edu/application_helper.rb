module Testerhome
  module Edu
    module ApplicationHelper
      def can_manage_training_courses?(user)
        if Setting.is_module_manager("edu", user.login)
          return true
        else
          false
        end
      end
    end
  end
end