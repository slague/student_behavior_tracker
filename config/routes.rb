Rails.application.routes.draw do


root to: 'sessions#new'

  resources :classrooms do
    resources :students do
      resources :observations
    end
  end


# resources :classrooms do
#   resources :students
# end
#
# resources :students do
#   resources :observations
# end
#
#
# namespace :students do
#   resources :observations
# end




  resources :behaviors

  resources :users, only: [:new, :create, :show]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  delete '/logout', to: "sessions#destroy"
end


#users another layer to my nested routes?
#only users can create "observations"


#admin- can change behavior list

#all users can: 1) see all classrooms, 2)link to each student in every classroom, 3)record new observations for any student

#A "teacher" (linked to a specific classroom) can edit/delete thier class lists (students' names)
#"teacher" can edit/delete/create "target behaviors" for students in thier class
