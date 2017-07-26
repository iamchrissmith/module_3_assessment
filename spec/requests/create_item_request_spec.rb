require 'rails_helper'

RSpec.describe 'POST /api/v1/items' do
  it 'creates a new item with the params' do
    params = { item: {
      name: 'Test Name',
      description: 'Lorem Ipsum',
      image_url: 'image.jpg'
      }}

    expect {
      post '/api/v1/items/', params
    }.to change{Item.count}.by(1)

    expect(response.status).to eq 201
    raw_item = JSON.parse(response.body)
    expect(raw_item).to be_a Hash
    expect(raw_item).to have_key "id"
    expect(raw_item['id']).to eq Item.last.id
    expect(raw_item).to have_key "name"
    expect(raw_item['name']).to eq params[:item][:name]
    expect(raw_item).to have_key "description"
    expect(raw_item['description']).to eq params[:item][:description]
    expect(raw_item).to have_key "image_url"
    expect(raw_item['image_url']).to eq params[:item][:image_url]
    expect(raw_item).not_to have_key 'created_at'
    expect(raw_item).not_to have_key 'updated_at'
  end
end

# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
