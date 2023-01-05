class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @stores = current_user.stores
  end

  def show
    @store = current_user.stores.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    store = Store.new(store_params)
    store.user_id = current_user.id
    store.save!
      redirect_to stores_path
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to stores_path
    else
      render :index
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to request.referer
  end

  private

  def store_params
    params.require(:store).permit(:date, :store_name, :comment)
  end

end
