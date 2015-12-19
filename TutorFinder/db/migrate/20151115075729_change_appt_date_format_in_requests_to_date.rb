class ChangeApptDateFormatInRequestsToDate < ActiveRecord::Migration
  def change
      change_column :requests, :apptDate, :date
  end
end
