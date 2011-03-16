Rh::Application.routes.draw do

  match "projetos/:action", :controller => 'projetos', :action => /[a-z_]+/i

  resources :comentarios

  resources :participacao_projetos

  resources :vinculos

  resources :users

  resources :competencias, :except => :index

  resources :projetos

  resources :cargos

  resources :conhecimentos

  resources :pessoas

  root :to => "application#index"

  get '/:id/desvincular' => "vinculos#finalize", :as => "finalize_vinculo"
  get '/projetos_finalizados' => "projetos#index_old", :as => "finalized_projects"
  get '/vinculos/new/:id' => "vinculos#new", :as => "new_param_vinculo"
  get '/pessoas/:id/vinculos_antigos' => "vinculos#old", :as => "old_vinculos"
  get '/pessoa/:id/projetos' => "projetos#meus_projetos", :as => "meus_projetos"
  get '/pessoa/:id/projetos_concluidos' => "projetos#meus_projetos_concluidos", :as => "meus_projetos_concluidos"
  get '/pessoa/:id/projetos/:id_projeto/participantes' => "projetos#participantes", :as => "participantes_projeto"
  post '/projeto/participantes/salvar_comentario' => "participacao_projetos#save_comment", :as => "save_comment"

  get '/admin_home' => "users#home"
  get '/admin_login' => "users#login"
  post '/admin_login' => "users#do_login"
  get '/admin_logout' => "users#do_logout"

  get '/home' => "pessoas#home"
  get '/login' => "pessoas#login"
  post '/login' => "pessoas#do_login"
  get '/logout' => "pessoas#do_logout"

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
