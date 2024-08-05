class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  before_save :capitalize_names

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validate :password_complexity
  
  has_one_attached :avatar
  has_many :boards, dependent: :destroy
  
  private

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end

  def password_complexity
    #regex does not include password length.
    #Length requirement is handled by config.password.length at config/initializers/devise.rb
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, "must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character."
  end
end
