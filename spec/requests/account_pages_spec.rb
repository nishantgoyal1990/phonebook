require 'spec_helper'

describe "Account pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_selector('h1',    text: 'New Account') }
    it { should have_selector('title', text: 'Welcome to the Sign up') }
  end
    describe "profile page" do
  	 #code to make a account variable
  	 let(:account) { FactoryGirl.create(:account) }
  	 before { visit account_path(account) }
  	 it { should have_selector('h1', text: account.name) }
  	 it { should have_selector('title', text: account.name) }
      end
      before { visit signup_path }
      let(:submit) { "Create Account" }
      describe "with invalid information" do
        it "should not create a user" do
        expect { click_button submit }.not_to change(Account, :count)
      end
    end

    describe "with valid information" do
      before(:each) do
		    visit signup_path
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Password confirmation", with: "foobar"
      end
      it "should create a user" do
      expect { click_button submit }.to change(Account, :count).by(1)
      end
    end
      describe "edit" do
        before { visit signin_path }
        let(:account) { FactoryGirl.create(:account) }
        before (:each) do
          fill_in "Email",    with: account.email.upcase
          fill_in "Password", with: account.password
          click_button "Sign in"
        end
        before { visit edit_account_path(account) }
        describe "page" do
          it { should have_selector('title', text: "Phonebook") }
        end
        describe "with invalid information" do
          before { click_button "Update Account" }
          it { should have_content('error') }
        end
          describe "with valid information" do
            let(:new_name)  { "New Name" }
            let(:new_email) { "new@example.com" }
            before (:each) do
              fill_in "Name",             with: new_name
              fill_in "Email",            with: new_email
              fill_in "Password",         with: account.password
              fill_in "Password confirmation", with: account.password
              click_button "Update Account"
            end
            it { should have_link('Sign out', href: signout_path) }
            specify { account.reload.name.should  == new_name }
            specify { account.reload.email.should == new_email }  
            end
        end
      end 
