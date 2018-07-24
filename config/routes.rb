Rails.application.routes.draw do
  

  get 'admin/clubs'
  get 'admin/cbooks'
  get 'admin/users'

  get 'home/mypage'
  get 'home/p_read'
  get 'home/introduce'
  get 'home/services'
  get 'home/calendar'
  
  get 'clubs/apply'
  get 'clubs/follow/:id' => 'clubs#follow'
  get 'clubs/unfollow/:id' => 'clubs#unfollow'
  get 'clubs/cbooks/:id' => 'clubs#cbooks'
  
  get 'cbooks/searching'
  get 'cbooks/choose'
  get 'cbooks/new/:club_id' => 'cbooks#new'
  post 'cbooks/reply/:id' => 'cbooks#reply'
  get 'cbooks/reply2/:id' => 'cbooks#reply2'
  post 'cbooks/reply2_register/:id' => 'cbooks#reply2_register'
  
  
  resources :cbooks
  resources :clubs
  resources :replys
  resources :reply2s
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root 'home#index'
  
  
  
end
