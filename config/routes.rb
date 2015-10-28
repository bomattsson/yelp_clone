Rails.application.routes.draw do

  root to: "restaurants#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :restaurants do
    resources :reviews
  end

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
