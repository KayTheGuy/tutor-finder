class AddStartTimeToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :startTime, :time
  end
end
