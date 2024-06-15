Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  Rails.application.routes.draw do
    resources :users, only: [] do
      resources :posts, only: [:create] do
        collection do
          get :user_posts, to: 'posts#user_posts'
          get :top_posts, to: 'posts#top_posts'
        end
      end
      resources :reviews, only: [:create]
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
