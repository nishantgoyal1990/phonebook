class ContactsController < ApplicationController
  before_filter :signed_in_account
  before_filter :correct_account 
  # GET /contacts
  # GET /contacts.json
  
  def index
    user_id=Account.find_by_remember_token(cookies[:remember_token]).id
    @contacts =  Account.find_by_id(user_id).contacts 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contacts }
          
      
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    accid=Contact.find(params[:id]).account
    @contact = Contact.find(params[:id])
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created, location: @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.json
  def update
    
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    
    @contact = Contact.find(params[:id])
    @contact.destroy
    
    respond_to do |format|
      format.html { redirect_to :controller => 'contacts', :action => 'index' }
      format.json { head :no_content }
    end
  end
  private
  
  def signed_in_account
   
    redirect_to root_path, notice: "Please sign in." unless signed_in?
  end

  def correct_account
    @user=Account.find_by_remember_token(cookies[:remember_token]).id
    
    redirect_to contacts_url, notice: "Permissions denied." unless current_user?(@user)
  end
end
