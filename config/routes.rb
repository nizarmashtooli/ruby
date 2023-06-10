Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update] do
        resources :job_applications
      end
      resources :job_posts
      resources :job_applications, only: [:index, :show, :create, :update]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
