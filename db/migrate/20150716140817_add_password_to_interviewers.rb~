class AddPasswordToInterviewers < ActiveRecord::Migration
	def self.up
		add_column :interviewers, :encrypted_password, :string
	end
	def self.down
		remove_column :interviewers, :encrypted_password
	end
end
