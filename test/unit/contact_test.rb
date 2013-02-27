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

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
