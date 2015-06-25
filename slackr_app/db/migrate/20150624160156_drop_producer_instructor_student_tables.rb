class DropProducerInstructorStudentTables < ActiveRecord::Migration
  def change
  	drop_table :producers
  	drop_table :instructors
  	drop_table :students
  end
end
