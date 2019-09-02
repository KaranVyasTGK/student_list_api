class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :city
      t.string :phone_number
      t.string :gender

      t.timestamps
    end
  end
end
