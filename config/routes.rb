Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  authenticate :user do
    resources :timelines,
      only: [:index, :show],
      param: :username

    resources :posts, only: [:create, :show]
    resources :bonds, param: :username do
      member do
        post :follow
        post :unfollow
        post :accept
        post :reject
        get :followers
        get :following
      end
    end
  end

  namespace :settings do
    resource :user, only: [:show, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :places, only: [:index]
    end
  end
end