class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
    has_many :users, :through => :comments
    belongs_to :users
    
	validates :title, presence: true, length: {minimum: 5}
	validates :body,  presence: true
      #paperclip
	#====================================================================
    has_attached_file :photo, :styles => { 
        :thumb => "100x100#",
        :small  => "150x150>",
        :medium => "200x200"},
    :default_url =>"post-logo.png",
                      :url  => "/assets/images/users/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/images/users/:id/:style/:basename.:extension"
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
    validates_attachment_size :photo, :less_than => 5.megabytes
    
end
