class AdminsController < ApplicationController

    def signin
        admin = Admin.find_by(email: params[:email])
        if admin and admin.authenticate(params[:password])
          render json: {token: issue_token({id: admin.id})}
        else
          render json: { error: "User/password combination failed." }, status: 400
        end
      end
    
      def validate
        admin = get_current_user
        if admin
          render json: {username: admin.email}
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
      end
    
      def inventory
        admin = get_current_user
        if admin
          render json: admin
        else
          render json: {error: 'Invalid user.'}, status: 404
        end 
      end


    def index
        admins = Admin.all
    end

    def show
        admin = Admin.find_by(id: params[:id])
    end

    def create
        admin = Admin.new(admin_params)
        if admin.save
            render json: {data: admin}, status: 200
        end
    end


    private

    def admin_params
        params.require(:admin).permit(:email, :password)
    end





end