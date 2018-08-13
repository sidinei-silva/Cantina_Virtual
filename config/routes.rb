Rails.application.routes.draw do

  get 'carrinho/index'
  root 'catalogo#index'
  get 'catalogo/index'
  get 'catalogo/detalhes'

  devise_for :clientes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :item_acompanhamentos
  resources :item_pedidos
  resources :acompanhamentos
  resources :produtos
  resources :pedidos
  resources :clientes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
