RssExpander::Application.routes.draw do
  
  resources :feeds, :constraints => { :id => /[\d\w\.\_\-]+/ }
  root :to => 'feeds#index'
end
