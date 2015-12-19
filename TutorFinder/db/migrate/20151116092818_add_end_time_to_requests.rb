class AddEndTimeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :endTime, :time
  end
end
