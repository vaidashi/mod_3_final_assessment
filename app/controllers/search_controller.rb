
class SearchController < ApplicationController

  def index
    response = Faraday.get("")

    raw_stores = JSON.parse(response.body, symbolize_names: true)

    @stores = raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end

end
