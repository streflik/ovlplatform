Ovlplatform::Application.routes.draw do

  scope "(:locale)", :locale => /en|pl/ do

    devise_for :users, :path => "/", 
	:path_names => { :sign_up => 'sign_up', :sign_in => 'sign_in', :sign_out => 'sign_out'}

    resources :users do
      member do
        get 'hub'
        get 'credits'
        get 'admin'
        get 'password'
        put 'password'
      end
    end

    resources :channels

    resources :videos do
       get 'unlock'
       resources :comments
    end

   resources :payments

    match '/about' => 'company#about'
    match '/terms' => 'company#terms'

    match '/sitemap.xml' => 'sitemap#sitemap'

    match '/feed' => 'videos#feed', :as => :feed, :defaults => { :format => 'atom' }

    match '/change_language/:locale' => 'company#change_language', :as=>:change_language
    root :to => "company#home"

  end


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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
