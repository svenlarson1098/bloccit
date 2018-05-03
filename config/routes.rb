Rails.application.routes.draw do
  
  #get 'sponsored_posts/show'

  #get 'sponsored_posts/new'

  #get 'sponsored_posts/edit'

  resources :topics do
  resources :posts, except: [:index]
  resources :sponsored_posts, except: [:index]
end

  resources :questions
  resources :advertisements
  resources :users, only: [:new, :create]
  
  post 'users/confirm' => 'users#confirm'
  
  #get 'welcome/contact'
  
  #get 'welcome/faq'
  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'

end

