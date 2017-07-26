require 'rails_helper'

RSpec.describe 'GET /api/v1/items' do
  let!(:items) { create_list(:item, 3) }

  it 'returns array of item hashes' do
    get "/api/v1/items"

    expect(response.status).to eq 200
    raw_items = JSON.parse(response.body)
    raw_item = raw_items.first

    expect(raw_items).to be_an Array
    expect(raw_items.count).to eq 3

    expect(raw_item).to be_a Hash
    expect(raw_item).to have_key "id"
    expect(raw_item['id']).to eq items.first.id
    expect(raw_item).to have_key "name"
    expect(raw_item['name']).to eq items.first.name
    expect(raw_item).to have_key "description"
    expect(raw_item['description']).to eq items.first.description
    expect(raw_item).to have_key "image_url"
    expect(raw_item['image_url']).to eq items.first.image_url
    expect(raw_item).not_to have_key 'created_at'
    expect(raw_item).not_to have_key 'updated_at'
  end
end
