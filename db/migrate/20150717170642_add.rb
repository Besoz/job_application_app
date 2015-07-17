class Add < ActiveRecord::Migration
  def up
    add_column :applications, :vacant_job_id, :integer
  end

  def down
    remove_column :applications, :vacant_job_id
  end
end

