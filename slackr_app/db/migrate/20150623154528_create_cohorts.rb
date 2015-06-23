class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
    	t.string :name, null: false, unique: true
    	t.date :start_date
    	t.date :end_date
    	t.integer :producer_id
    end
  end
end
