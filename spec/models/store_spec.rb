require 'rails_helper'

RSpec.describe 'Store' do
  it 'should respond to require attributes' do
    attrs = {
      name: 'Test',
      city: 'Test',
      distance: '',
      phone: '',
      type: ''
    }
    store = Store.new(attrs)
    expect(store).to respond_to(:name)
    expect(store).to respond_to(:city)
    expect(store).to respond_to(:distance)
    expect(store).to respond_to(:phone)
    expect(store).to respond_to(:type)
  end

end
