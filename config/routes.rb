Rails.application.routes.draw do

  resources :classrooms do
    resources :students
  end

  resources :behaviors

end
