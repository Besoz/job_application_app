class VacantJob < ActiveRecord::Base

  attr_accessible :description, :name
  has_many :applications
 
end
