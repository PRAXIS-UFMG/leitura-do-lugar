# frozen_string_literal: true

class UsersController < AdminController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    render ModelViewComponent.new model: @user, attributes: %i[name username admin]
  end

  # GET /users/new
  def new
    @user = User.new
    render ModelFormComponent.new model: @user, attributes: USER_ATTR
  end

  # GET /users/1/edit
  def edit
    render ModelFormComponent.new model: @user, attributes: USER_ATTR
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: t('notice.user.created')
    else
      flash[:error] = @user.errors.full_messages
      render ModelFormComponent.new(model: @user, attributes: USER_ATTR), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('notice.user.updated')
    else
      flash[:error] = @user.errors.full_messages
      render ModelFormComponent.new(model: @user, attributes: USER_ATTR), status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: t('notice.user.destroyed')
  end

  private

  USER_ATTR = %i[name username admin password password_confirmation].freeze

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit USER_ATTR
  end
end
