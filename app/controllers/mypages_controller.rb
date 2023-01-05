class MypagesController < ApplicationController
  def index
    @store = Store.order(created_at: :desc).limit(1)
  end
end
