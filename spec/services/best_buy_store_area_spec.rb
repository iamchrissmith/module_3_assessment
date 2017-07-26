require 'rails_helper'

RSpec.describe BestBuyStoreArea do
  let(:attrs) { {'search'=> '80202', 'page'=> '1'} }
  context '.total_count' do
    it 'returns a total number of stores found' do
      VCR.use_cassette('BestBuyStoreArea.total_count') do
        total_count = BestBuyStoreArea.new(attrs).total_count

        expect(total_count).to be_an Integer
      end
    end
  end
  context '.total_pages' do
    it 'returns a total number of pages found' do
      VCR.use_cassette('BestBuyStoreArea.total_pages') do
        total_pages = BestBuyStoreArea.new(attrs).total_pages

        expect(total_pages).to be_an Integer
      end
    end
  end
  context '.stores' do
    it 'returns array of raw stores found' do
      VCR.use_cassette('BestBuyStoreArea.stores') do
        raw_stores = BestBuyStoreArea.new(attrs).stores

        expect(raw_stores).to be_an Array
        raw_store = raw_stores.first

        expect(raw_store).to be_a Hash
        expect(raw_store).to have_key "longName"
        expect(raw_store).to have_key "city"
        expect(raw_store).to have_key "distance"
        expect(raw_store).to have_key "phone"
        expect(raw_store).to have_key "storeType"
      end
    end
  end
end
