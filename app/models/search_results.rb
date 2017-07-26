class SearchResults
  attr_reader :total_count,
              :zip,
              :page,
              :total_pages

  def initialize(attrs)
    @zip = attrs['search']
    @page = attrs['page'].to_i || 1
    @bestbuy_search = BestBuyStoreArea.new(attrs)
    @total_count = bestbuy_search.total_count
    @total_pages = bestbuy_search.total_pages.to_i
  end

  def stores
    bestbuy_search.stores.map do |store|
      Store.new(store)
    end
  end


  private
    attr_reader :response, :bestbuy_search
end
