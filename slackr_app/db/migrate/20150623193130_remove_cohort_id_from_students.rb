class RemoveCohortIdFromStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :cohort_id
  end
end
