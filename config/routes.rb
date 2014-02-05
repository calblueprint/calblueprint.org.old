Blueprint::Application.routes.draw do
  root to: 'pages#home'

  # Users
  devise_for :users, path: '',
  path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
                confirmation: 'verification', unlock: 'unblock' },
                controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # Pages
  match 'about', to: 'pages#about', as: 'about', via: :get
  match 'dashboard', to: 'pages#dashboard', as: 'dashboard', via: :get
  match 'projects', to: 'pages#projects', as: 'projects', via: :get
  match 'team', to: 'pages#team', as: 'team', via: :get
  match 'join', to: 'pages#join', as: 'join', via: :get
  match 'sponsors', to: 'pages#sponsors', as: 'sponsors', via: :get
  match 'contact', to: 'messages#new', as: 'contact', via: :get
  match 'hackathon', to: 'pages#hackathon', as: 'hackathon', via: :get

  get "messages/confirmation"
  # Messages--only create
  resources :messages
  resources :projects, only: [:show]

  # Admin
  namespace 'admin' do
    match '/', to: redirect('/dashboard'), via: :get
    resources :users
    match '/users/:id/activate', to: 'users#activate', as: 'activate_user', via: :post
    match '/users/:id/reveal', to: 'users#reveal', as: 'reveal_user', via: :post
    resources :projects
    resources :sponsors
    resources :applications do
      match 'hide', to: 'applications#hide', via: :post
    end
    resources :semesters do
      member do
        get 'make_current'
      end
    end
    match 'settings', to: 'pages#settings', as: 'settings', via: :get
  end
  match 'apply', to: 'admin/applications#new', as: 'new_application', via: :get

  match "*path", to: 'pages#error', as: 'error_page', via: :get
end
