Blueprint::Application.routes.draw do
  root :to => 'pages#home'

  # Users
  devise_for :users, :path => '',
  :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret',
                   :confirmation => 'verification', :unlock => 'unblock' },
                   :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  # Pages
  match 'about' => 'pages#about', :as => 'about', via: :get
  match 'projects' => 'pages#projects', :as => 'projects', via: :get
  match 'team' => 'pages#team', :as => 'team', via: :get
  match 'join' => 'pages#join', :as => 'join', via: :get
  # match 'hackathon' => 'pages#hackathon', :as => 'hackathon'
  match 'sponsors' => 'pages#sponsors', :as => 'sponsors', via: :get
  match 'contact' => 'messages#new', :as => 'contact', via: :get
  match 'dashboard' => 'pages#dashboard', :as =>'dashboard', via: :get
  match 'settings' => 'pages#settings', :as => 'settings', via: :get

  get "messages/confirmation"
  # Messages--only create
  resources :messages
  resources :projects, only: [:show]

  # Admin
  namespace 'admin' do
    resources :users
    match '/users/:id/activate' => 'users#activate', :as => 'activate_user', via: :post
    match '/users/:id/reveal' => 'users#reveal', :as => 'reveal_user', via: :post
    resources :projects
    resources :sponsors
    resources :applications
    resources :semesters do
      member do
        get 'make_current'
      end
    end
  end
  match '/apply' => 'admin/applications#new', :as => 'new_application', via: :get
end
