class UsersController < ApplicationController
  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
      UserMailer.with(user: @user).welcome_email.deliver_later
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
