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

  # Current hackathon
  scope 'hackathon' do
    match '/', to: 'hackathons#most_recent', as: 'hackathon', via: :get
    match 'submit', to: 'hackathon_submissions#new', as: 'submit_hack', via: :get
    match 'submit', to: 'hackathon_submissions#create', as: 'hackathon_submissions', via: :post
    match 'hacks', to: 'hackathon_submissions#most_recent_hacks', via: :get
  end

  # Previous Hackathons
  resources :hackathons, param: :url, only: [:show, :index] do
    resources :hackathon_submissions, param: :url, as: :hacks, path: :hacks, only: [:show, :index]
  end

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

    match 'applications/:semester_name/evaluations', to: 'evaluations#index', as: 'evaluations', via: :get
    resources :applications do
      match 'hide', to: 'applications#hide', via: :post
      match 'evaluate', to: 'evaluations#create', as: 'evaluate', via: [:post, :patch]
    end
    resources :semesters do
      member do
        get 'make_current'
      end
    end

    resources :hackathons, param: :url, only: [:new, :edit, :create, :update]

    match 'settings', to: 'pages#settings', as: 'settings', via: :get
  end
  match 'apply', to: 'admin/applications#new', as: 'new_application', via: :get

  match "*path", to: 'pages#error', as: 'error_page', via: :get
end
