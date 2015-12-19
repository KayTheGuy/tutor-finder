class AddIsConfirmedToRequests < ActiveRecord::Migration
  def change
      add_column :requests, :isConfirmed, :bool, :default => 0;
  end
end
