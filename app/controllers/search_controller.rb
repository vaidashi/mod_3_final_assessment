
class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?format=json&show=storeId,storeType,name,city,distance,phone&pageSize=20&apiKey=#{ENV["BEST_BUY_KEY"]}")

    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
    # binding.pry

    @stores = raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end

end


class Store

  attr_reader :name,
              :city,
              :distance,
              :phone_number,
              :store_type

  def initialize(attrs)
    @name = attrs[:name]
    @city = attrs[:city]
    @distance = attrs[:distance]
    @phone_number = attrs[:phone]
    @store_type = attrs[:store_type]
  end

end
