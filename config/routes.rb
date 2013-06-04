Blueprint::Application.routes.draw do

  get "messages/confirmation"

  # Uncomment to disable signing up through Devise (left in for manual testing)
  # match 'register/sign_up' => redirect('/404.html')

  root :to => 'pages#home'

  # Users
  devise_for :users, :path => '',
  :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock' }

  # Pages
  match 'about' => 'pages#about', :as => 'about'
  match 'projects' => 'pages#projects', :as => 'projects'
  match 'team' => 'pages#team', :as => 'team'
  match 'join' => 'pages#join', :as => 'join'
  match 'sponsors' => 'pages#sponsors', :as => 'sponsors'
  match 'contact' => 'messages#new', :as => 'contact'     #Michelle: I had to reroute this to a new page to handle error messages

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
    match 'application' => 'applications#new', :as => 'new_application'
  end
end
