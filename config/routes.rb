Rails.application.routes.draw do
  
  resources :topics
  resources :posts
  resources :questions
  resources :advertisements
  #get 'welcome/contact'
  
  #get 'welcome/faq'
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end

