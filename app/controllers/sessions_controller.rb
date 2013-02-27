class SessionsController < ApplicationController
def new
end

def create
	user=Account.find_by_email(params[:session][:email].downcase)
	 
				
	
if 
	user && user.authenticate(params[:session][:password])


#sign in success
	sign_in user
	
	redirect_to :controller => 'contacts', :action => 'index'
	else 
	render 'new'
end
	#sign in faliure

end

def destroy
	sign_out
	 redirect_to root_path
end
end