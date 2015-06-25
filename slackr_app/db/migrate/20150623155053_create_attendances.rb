class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
    	t.date :date
    	t.integer :student_id
    	t.boolean :present
    	t.boolean :late
    	t.boolean :absent
    	t.boolean :excused
    end
  end
end
