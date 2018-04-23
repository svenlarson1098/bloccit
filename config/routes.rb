Rails.application.routes.draw do
  
  resources :advertisements
  resources :posts
  resources :questions
  #get 'welcome/contact'
  
  #get 'welcome/faq'
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end

