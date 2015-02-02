class User < ActiveRecord::Base
	has_secure_password
	
	validates_uniqueness_of :email
	validates_uniqueness_of :name
	
	mount_uploader :photo, PhotoUploader
	
	#validates_confirmation_of :password
end
