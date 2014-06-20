class User < ActiveRecord::Base
	has_many :owners
	has_many :advertisers
	has_many :advertisements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        # :omniauthable, :omniauth_providers => [:facebook, :twitter]

  ROLES = %w[admin owner advertiser]

end