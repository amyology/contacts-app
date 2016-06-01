class ContactsController < ApplicationController
  def index
    search_term = params[:search_term]
    @contacts = Contact.all
    
    if search_term
      @contacts = Contact.all.where("last_name ILIKE ? OR first_name ILIKE ? OR middle ILIKE ? OR email ILIKE ? OR biography ILIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(first_name: params[:first_name], middle: params[:middle], last_name: params[:last_name], email: params[:email], phone: params[:phone], biography: params[:biography], user_id: current_user.id)

    if @contact.save
      flash[:success] = "Successfully created."
      redirect_to "/contacts/#{@contact.id}"
    else
      render :new
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(first_name: params[:first_name], middle: params[:middle], last_name: params[:last_name], email: params[:email], phone: params[:phone], biography: params[:biography], user_id: current_user.id)

    flash[:success] = "Successfully updated."
    redirect_to "/contacts/#{@contact.id}"
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:success] = "Successfully deleted."
    redirect_to '/'
  end
end
