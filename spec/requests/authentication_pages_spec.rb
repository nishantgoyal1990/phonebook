require 'spec_helper'

describe "Authentication" do
  
  describe "signin" do
    before { visit signin_path }
  
    describe "with valid information" do
      let(:account) { FactoryGirl.create(:account) }
      before do
        fill_in "Email",    with: account.email.upcase
        fill_in "Password", with: account.password
        click_button "Sign in"
      end
    end
  end
  
end