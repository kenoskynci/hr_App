class UpdateUsers < ActiveRecord::Migration
   def change
     @u = User.find_by( email: 'admin@live.ie' )
   #  @u.update_attributes :admin, true
   end
end