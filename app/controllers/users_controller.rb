class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, 	 only: :destroy  
  def index
    @users = current_group.users.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      if @user.group.authenticate(@user.group_password)
	if @user.save && @user.group.users.count == 1#Group.find_by_id(@user.group_id).users.nil?
	  @user.toggle!(:admin)
          flash[:success] = "Rejestracja przebiegla pomyslnie! jestes administratorem"
          redirect_to @user
	elsif @user.save && @user.group.users.count > 1
          flash[:success] = "Rejestracja przebiegla pomyslnie!"
          redirect_to @user
        else
	  flash[:failiure] = "niepoprawne haslo dla grupy"
          render 'new'
        end
      else 
	render 'new'
      end
  end
 
  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil zmieniony!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end
  private

    def signed_in_user
      unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
