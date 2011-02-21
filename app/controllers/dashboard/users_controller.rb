class Dashboard::UsersController < ApplicationController
  before_filter :check_authorization
  layout 'dashboard'

  set_tab :list_users, :only => :index
  set_tab :edit_user_roles, :only => :edit

  def index
    @users = User.paginate :page => params[:page], :per_page => 5, :order => 'username'
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    roles = params[:roles].values.map(&:to_i)

    if @user.add_roles roles
      flash[:success] = t 'messages.updated_successfully'
      redirect_to edit_dashboard_user_path(@user)
    else
      flash[:error] = t 'messages.failed_miserably'
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]

    if @user.delete
      flash[:success] = t('messages.deleted_successfully')
      redirect_to :action => :index
    end
  end
end
