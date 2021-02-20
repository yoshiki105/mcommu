class WorldsController < ApplicationController
  before_action :logged_in_user

  def index
    @worlds = World.all
  end

  def show
    @world = World.find(params[:id])
    @spots = @world.spots
    @spot = @world.spots.build
  end

  def new
    @world = World.new
  end

  def create
    @world = World.new(world_params)
    if @world.save
      redirect_to @world, flash: { success: 'ワールドを新規作成しました！' }
    else
      render 'new'
    end
  end

  def edit
    @world = World.find(params[:id])
  end

  def update
    @world = World.find(params[:id])
    if @world.update(world_params)
      redirect_to @world, flash: { success: 'ワールド情報を更新しました！' }
    else
      render 'edit'
    end
  end

  def destroy; end

  private

  # ストロングパラメータ
  def world_params
    require_params = %i[name seed]
    params.require(:world).permit(require_params)
  end

  # ワールドに参加しているかどうかを確認する
  # def joined?; end
end
