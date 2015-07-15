class Application < ActiveRecord::Base
	belongs_to :applicant
	belongs_to :interviewer
	has_many :interviews
  	attr_accessible :applicant_id, :application_status, :cv, :linkedin, :military_status, :priority, :vacany_id
end
