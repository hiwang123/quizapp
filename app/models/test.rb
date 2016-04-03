class Test < ActiveRecord::Base
	has_many :usertests, class_name: 'UserTest'
	has_many :users , -> {uniq}, through: :usertests
	has_many :questions
	validates_uniqueness_of :sharecode, :message => 'sharecode is used'
end
