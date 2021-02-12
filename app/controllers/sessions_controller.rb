class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      log_in @user
      if params[:session][:remember_me] == '1'
        remember(@user)
      else
        forget(@user)
      end
      redirect_to @user, flash: { success: 'おかえりなさい。ログインに成功しました！' }
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが間違っています'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url, flash: { success: 'ログアウトしました！' }
  end
end
