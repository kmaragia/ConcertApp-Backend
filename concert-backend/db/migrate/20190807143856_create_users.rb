class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :DOB
      t.string :password
      t.integer :Phone_number
      t.string :email

      t.timestamps
    end
  end
end
