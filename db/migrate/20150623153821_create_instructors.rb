class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
    	t.string :name, null: false
    	t.string :email, unique: true
    	t.string :password_digest
    	t.timestamps
    end
  end
end
