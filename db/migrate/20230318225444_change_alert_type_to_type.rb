class ChangeAlertTypeToType < ActiveRecord::Migration[7.0]
  def change
    change_table :alerts do |t|
      t.rename :alert_type, :type
    end
  end
end
