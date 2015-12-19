class User < ActiveRecord::Base
    #connection association
    has_many :connections, :dependent => :destroy
    has_many :contacts, :through => :connections
    has_many :inverse_connections, :class_name => "Connection", :foreign_key => "contact_id",:dependent => :destroy
    has_many :inverse_contacts, :through => :inverse_connections, :source => :user
    
    #request association

    #review association
    has_many :reviews, :dependent => :destroy
    has_many :tutors, :through => :reviews
    has_many :inverse_reviews, :class_name => "Review", :foreign_key => "tutor_id", :dependent => :destroy
    has_many :inverse_tutors, :through => :inverse_reviews, :source => :user
    
    #course association
	has_many :course_tutors, :dependent => :destroy
	has_many :courses, :through => :course_tutors
    
    has_many :comments, :through => :posts
    has_many :posts, :dependent => :destroy
	
	#blowfish hashing
	has_secure_password validations: true
	
    validates :password, :password_confirmation, :presence =>true

	# database integrity check
	#====================================================================
	validates :first_name, :presence => true, :length => {:maximum => 100}
	
	validates :last_name, :presence => true, :length => {:maximum => 100}
	
	validates :email, email_format: { message: "Incorrect email format. Please try again." }, :presence => true, :length => {:maximum => 100}, uniqueness: true
	
	validates :tel_number, :presence => false, :length => {:maximum => 100}, :numericality => {:allow_blank => true}
    validates :role, :presence => true
    
    #paperclip
	#====================================================================
    has_attached_file :photo, :styles => { 
        :thumb => "100x100#",
        :small  => "150x150>",
        :medium => "200x200"},
    :default_url =>"missing_:style.jpg",
                      :url  => "/assets/images/users/:id/:style/:basename.:extension",
                      :path => ":rails_root/public/assets/images/users/:id/:style/:basename.:extension"
    validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
    validates_attachment_size :photo, :less_than => 5.megabytes
    
    
    
    
    #search
	#====================================================================
    def self.search(search)
      if search
          where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
      else
          none
      end
    end
end

