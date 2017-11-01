
class SearchController < ApplicationController

  def index
    @stores = StorePresenter.find_stores_by_zip(params[:search_box])
  end

end
