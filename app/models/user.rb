class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, 
         :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         
  has_many :jobs, dependent: :destroy
  
  validates :name, presence: true

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.name = auth.info.name
     end
   end
end
