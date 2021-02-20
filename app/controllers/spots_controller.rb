class SpotsController < ApplicationController
  before_action :logged_in_user

  def create
    @world = World.find(params[:world_id])
    @spot = @world.spots.build(spot_params)
    if @spot.save
      redirect_to world_url(@spot.world), flash: { success: '新しく座標を追加しました！' }
    else
      flash.now[:danger] = '座標の追加に失敗しました。'
      render 'worlds/show'
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to @spot.world, flash: { success: '座標情報を更新しました！' }
    else
      render 'edit'
    end
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    flash[:success] = '場所情報を削除しました。'
    redirect_to world_path(@spot.world)
  end

  private

  # ストロングパラメータ
  def spot_params
    require_params = %i[place dimension point_x point_y point_z memo]
    params.require(:spot).permit(require_params)
  end
end
