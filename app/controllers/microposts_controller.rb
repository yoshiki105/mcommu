class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      redirect_to root_url, flash: { success: '新しく投稿しました！' }
    else
      flash.now[:danger] = '投稿に失敗しました。'
      @feed_items = current_user.feed.page(params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropostを削除しました！'
    redirect_to request.referrer || root_url
  end

  private

  # ストロングパラメータ
  def micropost_params
    require_params = %i[content image]
    params.require(:micropost).permit(require_params)
  end

  # 権限のあるユーザーかどうかを判別する
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
