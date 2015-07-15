class Interview < ActiveRecord::Base
	belongs_to :application
  attr_accessible :application_id, :score, :type_id
end
