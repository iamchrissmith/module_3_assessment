class SearchController < ApplicationController
  def index
    @results = SearchResults.new(search_params)
  end

  private
    def search_params
      params.permit(:search, :page)
    end
end
