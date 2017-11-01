

class StoreFinder

  def initialize
    @conn = Faraday.new("https://api.bestbuy.com") do |faraday|
      faraday.adapter(Faraday.default_adapter)
    end
  end

  def find_nearest_stores(zip)
    response = @conn.get("/v1/stores(area(#{zip},25))?format=json&show=storeId,storeType,name,city,distance,phone&pageSize=20&apiKey=#{ENV["BEST_BUY_KEY"]}")

    raw_stores = JSON.parse(response.body, symbolize_names: true)[:stores]
  end


  private

  attr_reader :zip

end
