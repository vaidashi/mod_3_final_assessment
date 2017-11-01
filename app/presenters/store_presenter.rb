
class StorePresenter

  def self.find_stores_by_zip(zip)
    raw_stores = StoreFinder.new.find_nearest_stores(zip)

    @stores = raw_stores.map do |raw_store|
      Store.new(raw_store)
    end
  end

end
