class ContactsController < ApplicationController
  def index
    search_term = params[:search_term]
    @contacts = Contact.all
    
    if search_term
      @contacts = Contact.all.where("last_name LIKE ? OR first_name LIKE ? OR middle LIKE ? OR biography LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new

  end

  def create
    @contact = Contact.create(first_name: params[:first_name], middle: params[:middle], last_name: params[:last_name], email: params[:email], phone: params[:phone], biography: params[:biography], user_id: current_user.id)

    flash[:success] = "Successfully created."
    redirect_to '/list/#{@contact.id'
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update(first_name: params[:first_name], middle: params[:middle], last_name: params[:last_name], email: params[:email], phone: params[:phone], biography: params[:biography], user_id: current_user.id)

    flash[:success] = "Successfully updated."
    redirect_to '/list/#{@contact.id}'
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:success] = "Successfully deleted."
    redirect_to '/'
  end
end
