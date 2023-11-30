class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    if params[:query].present?
      # Superman
      # @movies = @movies.where(title: params[:query])
      # @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")

      # sql_subquery = "title ILIKE :query OR synopsis ILIKE :query"
      # @movies = @movies.where(sql_subquery, :query => "%#{params[:query]}%")

      # sql_subquery = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL

      # SELECT * FROM movies JOIN directors ON directors.id = movies.director_id
      # WHERE ....
      # @movies = @movies.joins(:director).where(sql_subquery, :query => "%#{params[:query]}%")

      @movies = @movies.search_by_title_and_synopsis(params[:query])
    end
  end
end
