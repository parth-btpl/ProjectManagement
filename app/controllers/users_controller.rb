# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit; end

  def show; end

  def create

    @user = User.new(user_params)
    @user.password = '123456'
    if @user.save
      @user.invite!
      flash[:success] = t('user.create_message')
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = t('user.update_message')
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @users.destroy
    flash[:notice] = t('user.destroy_message')
    redirect_to users_path
  end

    private

  def find_user
    @user = user.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
