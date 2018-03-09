Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'labels#index'
  resources 'labels'
  post '/labels/create_from_sms'
end
