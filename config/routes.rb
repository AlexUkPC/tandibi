Rails.application.routes.draw do
  get 'timelines/index'
  get 'timelines/show'
  devise_for :users
  get 'home/index'
  root to: "home#index"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
