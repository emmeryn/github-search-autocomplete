class GithubController < ApplicationController
  def index
  end

  def search_repositories
    keywords = params[:query]
    @repositories = Github::Repositories.search(keywords)

    render json: @repositories.repositories
  end

end
