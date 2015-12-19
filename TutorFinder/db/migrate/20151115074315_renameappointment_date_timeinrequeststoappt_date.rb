class RenameappointmentDateTimeinrequeststoapptDate < ActiveRecord::Migration
  def change
      rename_column :requests, :appointmentDateTime, :apptDate
  end
end
