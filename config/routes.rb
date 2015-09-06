Rails.application.routes.draw do
  get 'surveys/index'

  get 'surveys/create'

  get 'surveys/new'

  get 'surveys/edit'

  get 'surveys/update'

  get 'surveys/destroy'

  get 'surveys/show'

  devise_for :users
  root to: 'pages#welcome'
  resources :surveys
end
