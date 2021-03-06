class Applicant < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :applications


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,	:presence => true,
  					:length => { :maximum => 50 }

  validates :email, :presence => true,
  					:format => { :with => email_regex },
  					:uniqueness => true

end
