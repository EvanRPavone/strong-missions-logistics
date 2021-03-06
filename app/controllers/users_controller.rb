class UsersController < ApplicationController
    before_action :must_be_admin

    def index
        @users = User.all
    end

    def show
        @user = User.friendly.find(params[:id])
    end

    private

    def must_be_admin
        unless current_user.admin?
            redirect_to trips_path, alert: "You don't have access to this page"
        end
    end
end