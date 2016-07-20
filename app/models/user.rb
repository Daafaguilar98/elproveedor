class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => {email: false, numeroidentificacion: true}
  validates :numeroidentificacion, uniqueness: true
    def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :orders
  
end
