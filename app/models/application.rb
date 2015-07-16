class Application < ActiveRecord::Base
	belongs_to :applicant
	belongs_to :interviewer
	has_many :interviews
	belongs_to :vacant_job
  	attr_accessible :applicant_id, :application_status, :cv, :linkedin, :military_status, :priority, :vacant_job_id
end
