Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  resources :events do
    collection do
      get 'basic_info'
      post 'save_basic_info'
      get 'edit_basic_info/:id' => 'events#edit_basic_info', as: :edit_basic_info
      put 'basic_info/:id' => 'events#update_basic_info', as: :update_basic_info
    end
    member do
      get 'emergency_info'
      post 'save_emergency_info'
      get 'edit_emergency_info'
      put 'emergency_info' => 'events#update_emergency_info', as: :update_emergency_info
      get 'picture_plan'
      post 'save_picture_plan'
      get 'edit_picture_plan' => 'events#edit_picture_plan', as: :edit_picture_plan
      put 'picture_plan' => 'events#update_picture_plan'
      get 'plan_itinerary'
      post 'save_plan_itinerary'
      get 'edit_plan_itinerary' => 'events#edit_plan_itinerary', as: :edit_plan_itinerary
      put 'plan_itinerary' => 'events#update_plan_itinerary'
      get 'gallery'
      post 'save_gallery'
      get 'edit_gallery' => 'events#edit_gallery', as: :edit_gallery
      put 'gallery' => 'events#update_gallery'
      get 'other_info'
      post 'save_other_info'
      get 'edit_other_info' => 'events#edit_other_info', as: :edit_other_info
      put 'other_info' => 'events#update_other_info'
      get 'review_info'
      post 'save_review_info'
      get 'publish_trip'
    end
  end

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
