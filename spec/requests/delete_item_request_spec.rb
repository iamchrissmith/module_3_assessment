require 'rails_helper'

RSpec.describe 'DELETE /api/v1/items/:id' do
  let!(:item) { create(:item) }

  it 'should delete the item and return 204' do

    expect {
      delete "/api/v1/items/#{item.id}"
    }.to change{Item.count}.from(1).to(0)

    expect(response.status).to eq 204
  end
end
