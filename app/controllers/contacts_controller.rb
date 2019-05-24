class ContactsController < ApplicationController

    respond_to :json

    def index
        contacts = Contact.all
        render json: {data: contacts}
    end

    def show
        contact = Contact.find_by(id: params[:id])
        render json: {data: contact}
    end

    def create
        contact = Contact.new(contact_params)
        if contact.save
            render json: {data: contact}
        end

    end


    private

    def contact_params
        params.require(:contact).permit(:email, :message, :subject, :name)
    end

end