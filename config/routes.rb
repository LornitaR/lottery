Rails.application.routes.draw do
  resources :tickets
  resources :ticket_lines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
