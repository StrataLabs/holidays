class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  devise :omniauthable, :rememberable, :trackable

end
