Rails.application.routes.draw do
  get '/array_list', to: 'array#index'
  post '/generate', to: 'array#create'
  get '/output/:array_id', to: 'array#show'

  post '/cars/format', to: 'cars#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
