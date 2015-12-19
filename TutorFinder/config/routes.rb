Rails.application.routes.draw do
    
  patch 'course/update_description'
  
    get 'reviews/index'

    get 'reviews/show'

    get 'reviews/new'

    get 'reviews/edit'

    get 'reviews/remove'

    get 'review/index'

    get 'review/show'

    get 'review/new'

    get 'review/edit'

    get 'review/remove'

    get 'comments/index'

    get 'comments/new'

    get 'search_tutor/index'

	get 'users/new'
    
	post 'users/new' => 'users#create'

	get 'users/index'

	get 'users/signup'

	get 'users/remove'

	get 'users/update'

	get 'users/update'

	get 'users/remove'

	get 'account/signup'

	get 'account/show_account'

	get 'account/edit_account'

	get 'account/remove_account'

	get 'home/index'

	get 'home/about'

  get 'home/blog'

    #match '/contacts',to: 'contacts#new',via: 'get'
    #post 'contacts' => 'contacts#create', :as => 'contacts'
    get 'contacts/new'
    post 'contacts' => 'contacts#create', :as => 'contacts'
    
    

  get 'admins/index'
    #resources "contacts", only: [:new, :create]

    resources :posts 
    get 'admins/index'

    get 'profiles/search'

    resources :comments, only: [:index, :create]
    get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
    
    #general routing
    resources :users
    resources :requests
    resources :photos
    resources :comments
    
    #request routing
    resources :requests do
        collection do
            get 'allnew/:tutor_id', to: 'requests#allnew'
            post 'allnew'
        end
    end
    
    #appointment routing
    resources :appointment do
        collection do
            get 'index/:id', to: 'appointment#index'
        end
    end
    
    resources :photos
    resources :reviews
        
    root 'home#index'
	match ':controller(/:action(/:id))', :via => [:get, :post]

end
