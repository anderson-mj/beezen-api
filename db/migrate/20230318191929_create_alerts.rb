class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.string :alert_type, index: true
      t.string :tag, array: true
      t.string :description, default: ""
      t.string :origin, default: ""

      t.timestamps
    end
  end
end
