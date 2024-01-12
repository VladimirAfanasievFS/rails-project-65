class Web::AuthController < ApplicationController
  def request
    # # Редирект на страницу аутентификации GitHub
    # redirect_to "/auth/#{params[:provider]}"
  end

  def callback
    auth_user_info = auth[:info]

    user = User.find_or_initialize_by(email: auth_user_info[:email].downcase)
    user.name = auth_user_info[:name]

    # NOTE: только для демонстрации
    user.admin = true

    if user.save
      sign_in user
      redirect_to root_path, notice: t('.success')
    else
      redirect_to new_user_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
