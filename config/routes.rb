Rails.application.routes.draw do


root to: 'sessions#new'

  resources :classrooms do
    resources :students do
      resources :observations
    end
  end


namespace :admin do
  resources :behaviors
end

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
