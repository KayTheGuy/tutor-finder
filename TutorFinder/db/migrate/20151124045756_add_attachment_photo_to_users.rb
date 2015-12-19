class AddAttachmentPhotoToUsers < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.attachment :photo
    end
  end

  def down
    remove_attachment :users, :photo
  end
end
