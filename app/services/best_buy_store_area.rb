class BestBuyStoreArea
  def initialize(attrs)
    @zip = attrs['search']
    @page = attrs['page'] || 1
    @response = Faraday.get "https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,longName,city,distance,phone&page=#{page}&apiKey=#{ENV['best_buy_key']}"
  end

  def total_count
    parsed_body['total']
  end

  def total_pages
    parsed_body['totalPages']
  end

  def stores
    parsed_body['stores']
  end

  private
    attr_reader :response, :zip, :page

    def parsed_body
      JSON.parse(response.body)
    end
end
