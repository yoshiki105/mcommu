class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  # beforeメソッド
  # ユーザーのログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_url, flash: { danger: 'ログインが必要です。' }
    end
  end
end
