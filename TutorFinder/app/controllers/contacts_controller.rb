class ContactsController < ApplicationController
     skip_before_action :require_login, :only => [:new,:create, :index]
     
  def index
  end
     def new
    @contact = Contact.new
  end


  def create
    @contact = Contact.new(contacts_params)
  #   if @contact.save
  #     flash[:notice] = 'Thank you for your message!'

  #   else
  #     flash[:error] = 'Cannot send message.'
  #     render 'new'
  #   end
  end
  private
    def contacts_params
        params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
