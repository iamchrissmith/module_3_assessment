require 'rails_helper'

RSpec.describe 'SearchResults' do
  context 'should respond to search methods' do
    let(:attrs) { {'search'=> '80202', 'page'=> '1'} }
    let(:search_results) { SearchResults.new(attrs) }

    describe '.total_count' do
      it 'should return total count of stores' do
        VCR.use_cassette('SearchResults.total_count') do
          expect(search_results).to respond_to(:total_count)
          expect(search_results.total_count).to be_a Integer
        end
      end
    end

    describe '.zip' do
      it 'should return searched zip' do
        VCR.use_cassette('SearchResults.zip') do
          expect(search_results).to respond_to(:zip)
          expect(search_results.zip).to be_a String
        end
      end
    end

    describe '.page' do
      it 'should return page as integer' do
        VCR.use_cassette('SearchResults.page') do
          expect(search_results).to respond_to(:page)
          expect(search_results.page).to be_a Integer
        end
      end
    end

    describe '.total_pages' do
      it 'should return total pages as integer' do
        VCR.use_cassette('SearchResults.total_pages') do
          expect(search_results).to respond_to(:total_pages)
          expect(search_results.total_pages).to be_a Integer
        end
      end
    end

    describe '.stores' do
      it 'should return array of store objects' do
        VCR.use_cassette('SearchResults.stores') do
          expect(search_results).to respond_to(:stores)
          expect(search_results.stores).to be_a Array
        end
      end
    end
  end
end
