class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :apikey
      t.string :email

      t.timestamps
    end
  end
end
