class CreateVacantJobs < ActiveRecord::Migration
  def change
    create_table :vacant_jobs do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
