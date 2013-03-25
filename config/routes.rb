Fixcomputer::Application.routes.draw do
  #root :to => "home#index"
  #get '/pricing', :to => "home#pricing",as: :pricing
  #resources :problems
  get '/status', :to => "problems#uuid_status"
  post '/android', :to => "problems#create"
  get '/android', :to => "problems#uuid"
  get '/android/:id', :to => "problems#uuid_show"
  post '/android/:id', :to => "problems#uuid_update"
  get '/pricing', :to => "prices#index"
end
