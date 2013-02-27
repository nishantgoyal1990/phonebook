# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  address         :text
#  pin_code        :integer
#  city            :string(255)
#  state           :string(255)
#  country         :string(255)
#  phone_no_home   :integer
#  phone_no_office :integer
#  email           :string(255)
#  account_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Contact < ActiveRecord::Base
  attr_accessible :account_id, :address, :city, :country, :email, :name, :phone_number_home, :phone_number_office, :pin_code, :state
before_save { |contact| contact.name  =name.capitalize }
belongs_to :account
validates :name, presence: true, length: { maximum: 50 }
validates :phone_number_office, numericality: { only_integer: true}, :allow_blank => true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, :allow_blank => true
validates :phone_number_home, :numericality => { only_integer: true }
validates :pin_code, numericality: { only_integer: true}, :allow_blank => true
end

