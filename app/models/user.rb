class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
      #has_one :profiles  
   #setup accessible attributes for our user model
   attr_accessible :email,  :password, :password_confirmation, :remember_me 
   
   validates_presence_of :username, on => :create, :message => "can't be blank"
end
