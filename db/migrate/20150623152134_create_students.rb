class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :name, null: false
    	t.string :email, unique: true
    	t.string :phone_num, unique: true
    	t.string :password_digest
    	t.timestamps
    end
  end
end
