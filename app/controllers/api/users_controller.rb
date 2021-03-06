module Api
    class UsersController < ApplicationController

      def index
        @user = User.first
      end

      def new
      end

      def create
        @user = User.new
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.desc = params[:desc]
        @user.img = params[:img]
        @user.user_type_id = params[:user_type_id]
        if @user.save
          render json: @user.to_json
        else
          render :new
        end
      end

      def show

      end

      def edit
        @user = User.find(params[:id])
      end

      def update
        user = User.find(params[:id])
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]
        user.desc = params[:desc]
        user.img = params[:img]
        user.user_type_id = params[:user_type_id]
        if user.save
          render json: user.to_json
        else
          render :edit
        end
      end

      def destroy
      end

    end
end
