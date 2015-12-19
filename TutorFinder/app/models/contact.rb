class Contact < ActiveRecord::Base
  validates :name,  :presence => true
  validates :email,    :presence => true
  validates :message, :presence => true
  validates :nickname,   :presence => false
end
