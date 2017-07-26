class Store
  attr_reader :name,
              :city,
              :distance,
              :phone,
              :type

  def initialize(params)
    @name = params['name']
    @city = params['city']
    @distance = params['distance']
    @phone = params['phone']
    @type = params['storeType']
  end
end
