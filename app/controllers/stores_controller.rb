class StoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @stores = Store.all
  end
end
