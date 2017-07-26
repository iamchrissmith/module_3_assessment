class SearchController < ApplicationController
  def index
    page = params['page'] || 1
    @results = SearchResults.new(params['search'], page)
  end


end
