class Interview < ActiveRecord::Base
	belongs_to :application
  attr_accessible :application_id, :score, :vacantjob_id
end
