class Interviewer < ActiveRecord::Base
	has_many :applications

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  	attr_accessible :name, :position, :email, :password, :password_confirmation

  	  validates :name,	:presence => true,
  					:length => { :maximum => 50 }

  	  validates :password,	:presence => true,
  	  						:confirmation => true,
  	  						:length => { :within => 6..40 }

  	  validates :email, :presence => true,
  					:format => { :with => email_regex },
  					:uniqueness => true

end
