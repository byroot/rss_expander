RssExpander::Application.routes.draw do
  
  resources :feeds, :constraints => { :id => /[\d\w\.\_\-]+/ }
  
end
