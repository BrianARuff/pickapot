Rails.application.routes.draw do

  get 'sessions/new'

  root 'recipes#index'
  get 'recipe_categories' => 'recipes#recipe_by_category'
  get 'items_by_category' => 'recipes#items_by_category'
  resources :recipes do
    resources :reviews, except: [:show, :index]
  end
  resources :comments
  devise_for :users
  resources :categories
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
