class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :authentication_keys => [:numeroidentificacion]
    def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :orders
  
end
