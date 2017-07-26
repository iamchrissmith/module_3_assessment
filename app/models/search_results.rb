class SearchResults
  attr_reader :total_count,
              :zip,
              :page,
              :total_pages

  def initialize(zip, page)
    @page = page.to_i
    @zip = zip
    @response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&page=#{page}&apiKey=#{ENV['best_buy_key']}"
    @total_count = JSON.parse(response.body)['total']
    @total_pages = JSON.parse(response.body)['totalPages']
  end

  def stores
    JSON.parse(response.body)['stores'].map do |store|
      Store.new(store)
    end
  end


  private
    attr_reader :response
end
