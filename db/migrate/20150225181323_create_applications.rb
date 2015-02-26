class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :position, index: true
      t.references :user, index: true
      t.text :message

      t.timestamps null: false
    end
    add_foreign_key :applications, :positions
    add_foreign_key :applications, :users
  end
end
