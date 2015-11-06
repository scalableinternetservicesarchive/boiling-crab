class User < ActiveRecord::Base
    has_secure_password

    has_many :posts, dependent: :destroy
    has_many :friendships
    has_many :friends, :through => :friendships
    has_attached_file :image
    
    validates :first_name, :last_name, :email, :password_digest, :presence => true
    validates :email, uniqueness: true
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
