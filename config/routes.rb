Rails.application.routes.draw do
  post '/nuevomarca' => 'branding_products#nuevomarca'
  post '/nuevocategoria' => 'category_products#nuevocategoria'

    get '/add' => 'orders#add_product'
    get '/orders' => 'orders#index'
    get '/facturas' => 'orders#invoices'
    get '/validate' => 'orders#validate'
    
  resources :orders
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
