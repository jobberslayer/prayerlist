Prayerlist::Application.routes.draw do
  get "reports/answered"

  get "reports/unanswered"

  devise_for :users
  root to: 'front_page#index'

  resources :prayer_requests

  get 'prayer_request/:id/toggle_answered', to: 'prayer_requests#toggle_answered', as: :toggle_answered_prayer_request

  get '/prayer_requests/:prayer_request_id/new/', to: 'prayer_requests#new_update', as: :new_update_prayer_request
  post '/prayer_requests/:prayer_request_id/new/', to: 'prayer_requests#create_update', as: :new_update_prayer_request
  get '/prayer_requests/:prayer_request_id/edit/:prayer_update_id', to: 'prayer_requests#edit_update', as: :edit_update_prayer_request
  put '/prayer_requests/:prayer_request_id/update/:prayer_update_id', to: 'prayer_requests#update_update', as: :update_update_prayer_request
  delete '/prayer_requests/:prayer_request_id/delete/:prayer_update_id', to: 'prayer_requests#destroy_update', as: :delete_update_prayer_request

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
