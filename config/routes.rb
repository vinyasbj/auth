Rails.application.routes.draw do
  resources :posts
  devise_for :patients
  devise_for :caregivers, controllers: { sessions: 'caregivers/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
