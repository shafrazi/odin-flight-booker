Rails.application.routes.draw do
  get 'bookings/new'
  get 'flights/index'
  root 'flights#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
