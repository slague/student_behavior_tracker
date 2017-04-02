Rails.application.routes.draw do

  resources :classrooms do
    resources :students
  end 

end
