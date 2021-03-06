Rails.application.routes.draw do
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  
  post "welcome/login_attempt" => "welcome#login_attempt"
  resources :mentors
  get "mentors/detail/:id" => "mentors#detail", as: :mentors_detail

  get "welcome/forget_password" => "welcome#forget_password"
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get "administrators/new" => "administrators#new"
  get "administrators/create/:id" => "administrators#create", as: :administrators_create
  get "administrators/index" => "administrators#index"
  get "administrators/delete_one/:id" => "administrators#delete_one", as: :administrators_delete_one
  get "administrators/drop_table" => "administrators#drop_table"
  get "administrators/drop_all_mentor" => "administrators#drop_all_mentor"
  get "welcome/faq_open" => "welcome#faq_open"
  
  get "welcome/index" => "welcome#index"
  get "welcome/parent_signin" => "welcome#parent_signin"
  get "welcome/logout" => "welcome#logout"
  get "mentors_new" => "mentors#new"
  get "groupinvs/send_inv/:id" => "groupinvs#send_inv", as: :groupinvs_send_inv
  get "groupinvs/accept_inv_mentor/:id" => "groupinvs#accept_inv_mentor", as: :groupinvs_accept_inv_mentor
  get "groupinvs/accept_inv_group/:id" => "groupinvs#accept_inv_group", as: :groupinvs_accept_inv_group
  get "groupinvs/cancel_inv/:id" => "groupinvs#cancel_inv", as: :groupinvs_cancel_inv
  get "groupinvs/decline_inv/:id" => "groupinvs#decline_inv", as: :groupinvs_decline_inv
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get "parent" => "parent#index"
  get "parent/edit" => "parent#edit"
  put "parent" => "parent#update"
  get "parent/new" => "parent#new"
  post "parent/create" => "parent#create"
  
  get "mentor/quit_group/:id" => "mentors#quit_group", as: :mentor_quit_group
  get "invitation/group_send_inv_to_child/:id" =>"invitation#group_send_inv_to_child", as: :invitation_group_send_inv_to_child
  get "invitation/child_accept_group/:id" =>"invitation#child_accept_group", as: :invitation_child_accept_group
  get "invitation/cancel_inv/:id" => "invitation#cancel_inv", as: :invitation_cancel_inv
  get "invitation/decline_inv/:id" => "invitation#decline_inv", as: :invitation_decline_inv
  get "invitation/child_send_request_to_group/:id" => "invitation#child_send_request_to_group", as: :invitation_child_send_request_to_group
  
  get "invitation/group_accept_child/:id" => "invitation#group_accept_child", as: :invitation_group_accept_child
  #get "group" => "group#index"
  #get "group/edit" => "group#edit"
  #put "group" => "group#update"
  #delete "group" => "group#destroy"
  resources :user
  resources :rglusers
  get 'fbuser/fb_login' => 'fbuser#fb_login', as: :fb_auth
  get 'casusers/cas_login' => 'casusers#cas_login', as: :cas_login
  get 'casusers/cas_logout' => 'casusers#cas_logout', as: :cas_logout
  resources :child
  get "child/detail/:id" => "child#detail", as: :child_detail
  get "child/message/:id" => "child#message", as: :child_message
  get "child/quit_group/:id" => "child#quit_group", as: :child_quit_group
  
  
  resources :group do
    collection do
      get 'index_for_parent'
    end
  end
    
  get 'group/:id/change' => 'group#change', as: :change_group
  get "group/set_complete/:id" => "group#set_complete", as: :group_set_complete
  get "group/set_need_mentor/:id" => "group#set_need_mentor", as: :group_set_need_mentor
  get "group/detail/:id" => "group#detail", as: :group_detail
  get "group/message/:id" => "group#message", as: :group_message
  # get "delmem/:id" => "group#del_member", as: 'deletemember'
  #resources :group
  # You can have the root of your site routed with "root"
  root 'welcome#index'
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
