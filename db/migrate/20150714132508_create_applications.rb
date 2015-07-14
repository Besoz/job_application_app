class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :cv
      t.string :linkedin
      t.integer :priority
      t.integer :military_status
      t.integer :vacany_id
      t.integer :application_status
      t.integer :applicant_id

      t.timestamps
    end
  end
end
