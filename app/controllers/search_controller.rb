class SearchController < ApplicationController
  def index
    @results = SearchResults.new(params['search'])
  end
end
