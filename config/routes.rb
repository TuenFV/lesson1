Rails.application.routes.draw do
  namespace :admin do
    resources :categories
  end
  
  scope :admin do
    resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  end
  
  root 'admin/categories#index'
end
