Rails.application.routes.draw do

  root to: "restaurants#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  resources :restaurants, shallow: true do
    resources :reviews do
      resources :endorsements
    end
  end

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
end
