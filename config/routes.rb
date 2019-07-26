Rails.application.routes.draw do
  resources :tickets do
    resources :statuses, only:[:update]
    put 'status', to: 'statuses#update', as: :status_change
  end
  resources :ticket_lines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
