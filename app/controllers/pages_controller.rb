class PagesController < ApplicationController
  def home
    @collection = PgSearch::Document.all

    if params[:query].present?
      @collection = PgSearch.multisearch(params[:query])
    end
  end
end
