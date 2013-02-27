# == Schema Information
#
# Table name: accounts
#
#  id                    :integer          not null, primary key
#  name                  :string(255)
#  email                 :string(255)
#  password              :string(255)
#  password_confirmation :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  password_digest       :string(255)
#  remember_token        :string(255)
#

class Account < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
has_secure_password

before_save { |account| account.email =email.downcase }
before_save { |account| account.name  =name.capitalize }
before_save :create_remember_token
validates :name, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
validates :password, presence: true, length: { minimum: 6 }
validates :password_confirmation, presence: true 
private
def create_remember_token
	self.remember_token = SecureRandom.urlsafe_base64
end
has_many :contacts, :dependent => :destroy
end
