Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'github#index'
  get 'github/search_repositories/:query', to: 'github#search_repositories', as: 'github_repository_search'
end
