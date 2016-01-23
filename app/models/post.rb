class Post < ActiveRecord::Base
  belongs_to :user
 #  before_save :add_user_id_to_new_post

 # private
 #   def add_user_id_to_new_post
 #     self.user_id = self.current_user.id
 #   end

end
