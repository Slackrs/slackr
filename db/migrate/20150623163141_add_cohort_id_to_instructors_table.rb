class AddCohortIdToInstructorsTable < ActiveRecord::Migration
  def change
  	add_column :instructors, :cohort_id, :integer
  end
end
