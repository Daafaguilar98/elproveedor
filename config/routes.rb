Rails.application.routes.draw do
  
  resources :products
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'pages#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#index', as: :unauthenticated_root
    end
  end

end
