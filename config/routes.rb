HumbleStore::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  #mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  constraints :subdomain => /^(?!admin)/ do
    resources :cart_items

    resources :carts

    resources :orders

    resources :shipping_addresses

    resources :item_tags

    resources :tags

    resources :categories

    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
    
    resources :items
    root 'high_voltage/pages#show', id: 'home'

  end

  constraints subdomain: "admin" do
    scope :module => "admin" do
      resources :items
      resources :users
      resources :orders
      get "/items/new/:category_id/", to: "items#new_form", as: :new_item_form
      post "/items/new/upload_image_cover", to: "items#upload_cover_image"
      resources :categories
      #root :to => "home#dashboard"
      get "/", to: "home#dashboard" 
    end
    
  end  

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
