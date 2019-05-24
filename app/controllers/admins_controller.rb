class AdminsController < ApplicationController

    def index
        admins = Admin.all
    end

    def show
        admin = Admin.find_by(id: params[:id])
    end

    def create
        
        admin = Admin.new(admin_params)
        if admin.save
            render json: {data: admin}
        end
    end


    private

    def admin_params
        params.require(:admin).permit(:email, :password)
    end





end