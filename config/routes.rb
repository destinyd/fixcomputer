Fixcomputer::Application.routes.draw do
  #root :to => "home#index"
  #get '/pricing', :to => "home#pricing",as: :pricing
  #resources :problems
  post '/android', :to => "problems#create"
  get '/android', :to => "problems#uuid"
end
