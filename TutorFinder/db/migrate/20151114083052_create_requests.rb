class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :tutorID
      t.integer :studentID
      t.integer :courseID
      t.datetime :appointmentDateTime
      t.text :note

      t.timestamps null: false
    end
  end
end
