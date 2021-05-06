# frozen_string_literal: true

class UsersController < AdminController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    render CollectionIndexComponent.new User, User.all, :'user-add',
                                        username: { header: 'w-32' },
                                        name: { header: 'w-56' },
                                        admin: { cell: 'text-sm text-right' }
  end

  # GET /users/1 or /users/1.json
  def show
    render ModelViewComponent.new @user, :name, :name, :username, :admin
  end

  # GET /users/new
  def new
    @user = User.new
    render render_form
  end

  # GET /users/1/edit
  def edit
    render render_form
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: t('notice.created', model: User.human_title_name)
    else
      render render_form, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('notice.updated', model: User.human_title_name)
    else
      render render_form, status: :unprocessable_entity
    end
  end

  def render_form
    ModelFormComponent.new @user, :name, *USER_ATTR
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: t('notice.destroyed', model: User.human_title_name)
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
