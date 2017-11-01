
class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name,city,distance,phone&pageSize=20&apiKey=#{ENV["BEST_BUY_KEY"]}")

    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    binding.pry

    @stores = raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end

end
