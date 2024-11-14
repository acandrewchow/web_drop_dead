Rails.application.routes.draw do

  # home page
  root 'home#index'

  # Route to display the create account page for a new user
  get 'sign_up', to: 'users#new', as: 'new_user'

  # Routes for displaying game page / playing the game
  get 'drop_dead_games/new', to: 'drop_dead_games#new', as: :new_drop_dead_game  
  post 'drop_dead_games/play', to: 'drop_dead_games#play', as: :play_drop_dead_game  

  # Route to display the user page
  get 'users', to: 'users#users', as: 'user_page'  
  # Route to login as a new user
  post 'login', to: 'users#create_session', as: 'create_session_users'

  # Route to create a new user
  post 'create', to: 'users#create', as: 'create_new_user'

  # Route to retrieve he history
  get 'history', to: 'history#history'
end

# rails server -d -p 36051 -b 0.0.0.0
# ps aux | grep puma