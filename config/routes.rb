Rails.application.routes.draw do
  get    '/log_in' => 'log_in#new', as: :log_in
  post   '/log_in' => 'log_in#create'
  post   '/log_out' => 'log_in#destroy', as: :log_out

  get    '/change_password' => 'passwords#new', as: :change_password
  post   '/change_password' => 'passwords#update'

  get    '/courses/:id' => 'courses#show', as: :course
  get    '/lessons/:id' => 'lessons#show', as: :lesson
  get    '/units/:id'   => 'units#show', as: :unit
  get    '/units/:id/complete' => 'units#complete', as: :complete_unit

  root   'course_enrollments#index'
end
