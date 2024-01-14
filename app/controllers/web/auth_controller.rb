# frozen_string_literal: true

class Web::AuthController < ApplicationController
  # def request
  #   # Редирект на страницу аутентификации GitHub
  #   redirect_to "/auth/#{params[:provider]}"
  # end

  def callback
    pp 11_111_111_111_111_111_111
    auth_user_info = auth[:info]
    pp 2_222_222_222_222_222_222

    user = User.find_or_initialize_by(email: auth_user_info[:email].downcase)
    user.name = auth_user_info[:name]

    # NOTE: только для демонстрации
    # user.admin = true

    if user.save
      sign_in user
      redirect_to root_path, notice: t('.success')
    else
      redirect_to new_user_path
    end
  end

  def logout
    sign_out
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
