Rails.application.routes.draw do

  root 'catalogo#index'
  get 'catalogo/index'
  get 'catalogo/detalhes'
  get 'carrinho/index'
  post 'carrinho/index'
  get 'carrinho', to: 'carrinho#index'
  post 'carrinho/remove', to: 'carrinho#remove'
  post 'carrinho/recuperar_cart', to: 'carrinho#recuperar_carrinho'
  put '/admin', to: 'pedidos#update'


  devise_for :clientes

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :item_acompanhamentos
  resources :item_pedidos
  resources :acompanhamentos
  resources :produtos
  resources :pedidos
  resources :clientes
  resources :pedidos

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
