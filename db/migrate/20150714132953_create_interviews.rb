class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.integer :score
      t.integer :application_id
      t.integer :type_id

      t.timestamps
    end
  end
end
