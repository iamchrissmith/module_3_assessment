class SearchResults
  attr_reader :total_count, :zip
  def initialize(zip)
    @zip = zip
    @response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&page=1&apiKey=#{ENV['best_buy_key']}"
    @total_count = JSON.parse(response.body)['total']
  end

  def stores
    JSON.parse(response.body)['stores'].map do |store|
      Store.new(store)
    end
  end


  private
    attr_reader :response
end
