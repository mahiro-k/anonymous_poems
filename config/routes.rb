Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/about' => 'home#about'
  
  get '/poems/index' => 'poem#index'
  get '/poems/:id' => 'poem#show'
end
