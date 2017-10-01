class CreateAgents < ActiveRecord::Migration[5.1]
  def change
    create_table :agents do |t|
      t.string :field_name
      t.string :base
      t.date :deployment_date

      t.timestamps
    end
  end
end
