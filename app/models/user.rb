class User < ActiveRecord::Base
	has_secure_password

	validates :name, :email, :presence => true
	validates_uniqueness_of :email
	validates :password_digest, presence: true
  has_many :photos
end
