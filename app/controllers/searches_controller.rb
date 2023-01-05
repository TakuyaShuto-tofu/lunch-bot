class SearchesController < ApplicationController
  before_action :authenticate_user!
  after_action :allow_iframe, only: [:index]

  def index
    #ここに検索するロジックを書く→googleplaces
    @client = GooglePlaces::Client.new(ENV["GOOGLE_API_KEY"])
    if params[:lat].present? && params[:lng].present? && params[:keyword].present?
      place_id = @client.spots(params[:lat], params[:lng], language: 'ja', name: params[:keyword], opennow: true).sample.place_id
      @spot = @client.spot(place_id, :language => 'ja')
    end

  end

  private
  def allow_iframe
    url= "#{@spot&.url}"#if文使って書く方がいい
    url = "https://www.google.com"
    response.headers['X-Frame-Options'] = "ALLOW-FROM #{url}"
    response.headers['Content-Security-Policy'] = "frame-ancestors #{url}"
  end
  
end
