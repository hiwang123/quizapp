class User < ActiveRecord::Base
	has_secure_password
	has_many :usertests, class_name: 'UserTest'
	has_many :tests, -> {uniq}, through: :usertests
	validates_uniqueness_of :email, :message => "email is used"
end
