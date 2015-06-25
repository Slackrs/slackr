class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, null: false
    	t.string :email, unique: true, null: false
    	t.string :phone_num
    	t.string :password_digest
    	t.string :type
    	t.timestamps
    end
  end
end
