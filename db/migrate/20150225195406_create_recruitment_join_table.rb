class CreateRecruitmentJoinTable < ActiveRecord::Migration
  def change
    create_join_table :positions, :applications do |t|
      # t.index [:position_id, :application_id]
      t.index [:application_id, :position_id], unique: true
      t.belongs_to :application
      t.belongs_to :position
    end
  end
end
