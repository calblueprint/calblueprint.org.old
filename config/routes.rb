Blueprint::Application.routes.draw do

  root :to => 'pages#home'

  # Users
  devise_for :users, :path => '',
  :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock' }, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  # Pages
  match 'about' => 'pages#about', :as => 'about'
  match 'projects' => 'pages#projects', :as => 'projects'
  match 'team' => 'pages#team', :as => 'team'
  match 'join' => 'pages#join', :as => 'join'
  match 'sponsors' => 'pages#sponsors', :as => 'sponsors'
  match 'contact' => 'messages#new', :as => 'contact'
  match 'dashboard' => 'pages#dashboard', :as =>'dashboard'

  get "messages/confirmation"
  # Messages--only create
  resources :messages

  # Admin
  namespace 'admin' do
    resources :users
    match '/users/:id/activate' => 'users#activate', :as => 'activate_user'
    match '/users/:id/reveal' => 'users#reveal', :as => 'reveal_user'
    resources :projects
    resources :sponsors
    resources :applications
    resources :semesters do
      member do
        get 'make_current'
      end
    end
  end
  match '/apply' => 'admin/applications#new', :as => 'new_application'
end
