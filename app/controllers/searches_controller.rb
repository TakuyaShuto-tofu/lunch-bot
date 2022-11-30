class SearchesController < ApplicationController
  before_action :authenticate_user!

  def index
    # keyword = params[:keyword]

    #ここに検索するロジックを書く→googleplaces
    @client = GooglePlaces::Client.new(ENV["GOOGLE_API_KEY"])
    if params[:lat].present? && params[:lng].present?
      @spot = @client.spots(params[:lat], params[:lng], language: 'ja', name: params[:keyword], opennow: true).sample
    end
    # @spot = @client.spots(33.2428226, 131.6032689, language: 'ja', name: params[:keyword], opennow: true).sample

  end
end
