Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  get '/search', to: "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
     resource :favorite, only:[:create, :destroy]
     resources :book_comments, only:[:create, :destroy]
   end

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
  end

  resources :groups, only: [:new, :index, :show, :edit, :update,:create] do
    resource :group_user, only: [:create, :destroy]
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

