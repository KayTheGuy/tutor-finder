class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.text :body, :null =>false
        t.references :post, :null => false
        t.references :user, :null => false
        t.timestamps :null => false
    end
  end
end
