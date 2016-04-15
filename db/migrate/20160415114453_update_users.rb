class UpdateUsers < ActiveRecord::Migration
  def change
  	@u = User.find_by( email: 'admin@email.ie' )
  		if @u != nil
  		@u.update_attribute :admin, true
  	end
  end
end
