Rails.application.routes.draw do
   get   '/log_in' => 'log_in#new', as: :log_in
  post   '/log_in' => 'log_in#create'

  get    '/change_password' => 'passwords#new', as: :change_password
  post   '/change_password' => 'passwords#update'

  root   'home#show'
end
