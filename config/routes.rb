Rails.application.routes.draw do
  resources :products

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

  resources :candidates do
    member do
      post :vote
    end
  end
  
  get 'bmi', to: "bmi#index"
  post 'bmi/result', to: 'bmi#result'
  # nested routes(start)
  resources :users do
    resources :posts , only: [:index, :show, :new, :create]
  end
  resources :posts , only: [:index, :show, :edit, :update, :destroy, :new]
  # nested routes(end)

  get "/hello_world", to: "pages#hello"

  
  # resources :posts
  #  resources :products, only: [:index, :show] 只需要顯示index和show功能即可
  # 或是反過來這樣寫
  # resources :products, except: [:new, :create, :edit, :update, :destroy]
  # resource :posts # 沒有s，單數resource

  # resources :users
  # root "posts#index"  # get "/", to: "posts#index" 
  # get "/postUsers", to: "posts#index"
  # get "/postUsers/:id", to: "posts#show"
  # get "/postsReplace", to: redirect("/posts")

  # get "/posts/:id", to: "posts#show" 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end