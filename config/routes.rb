Rails.application.routes.draw do

  resources :users

  devise_for :users, :skip => [:registrations, :sessions]

  as :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session
    post "/login" => "devise/sessions#create", :as => :user_session
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
  end


  #devise_for :users, :skip => [:registrations, :sessions]
  #devise_for :users,  :controllers => {:registrations => 'users/registrations'}
  #scope "/admin" do
  #  resources :users
  #end  #devise_for :sellers, :controllers => {:registrations => 'sellers/registrations'}
  #devise_for :admins
  resources :products
  resources :categories
  resources :providers
  resources :documents
  resources :orders
  resources :egresses
  resources :orders do
    resources :order_details
  end
  resources :order_details
  get 'sales/:id' => 'sales#show', as: "show_sale"
  get 'sales/' => 'sales#index'
  get 'order/' => 'orders#show', as: "my_order"
  match "cash_count" => "cash_count#show", as: :cash_count, via: [:get, :post]
  root 'welcome#index'

  
  get 'orders/checkout/:id' => 'orders#checkout', as: 'checkout_order'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
