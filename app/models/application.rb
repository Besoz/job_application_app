class Application < ActiveRecord::Base
  attr_accessible :applicant_id, :application_status, :cv, :linkedin, :military_status, :priority, :vacany_id
end
