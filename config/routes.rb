Rails.application.routes.draw do
  get '/' => 'home#top'
  get '/about' => 'home#about'
  
  get '/poems/index' => 'poem#index'
  get '/poems/create' => 'poem#create_form'
  get '/poems/:id/contribute' => 'poem#contribute_form'
  get '/poems/:id' => 'poem#show'
  
  post '/poems/create' => 'poem#create'
  post '/poems/:id/contribute' => 'poem#contribute'
  
end
