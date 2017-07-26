require 'rails_helper'

RSpec.describe 'GET /api/v1/items/:id' do
  let(:item) { create(:item) }

  it 'should return the item details' do
    get "/api/v1/items/#{item.id}"

    expect(response.status).to eq 200
    raw_item = JSON.parse(response.body)
    expect(raw_item).to be_a Hash
    expect(raw_item).to have_key "id"
    expect(raw_item['id']).to eq item.id
    expect(raw_item).to have_key "name"
    expect(raw_item['name']).to eq item.name
    expect(raw_item).to have_key "description"
    expect(raw_item['description']).to eq item.description
    expect(raw_item).to have_key "image_url"
    expect(raw_item['image_url']).to eq item.image_url
    expect(raw_item).not_to have_key 'created_at'
    expect(raw_item).not_to have_key 'updated_at'
  end
end
