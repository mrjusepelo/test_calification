Rails.application.routes.draw do
  root to: "homes#index"

  resources :asignatures, only: [:index, :new, :create, :destroy] do
    member do
      get "students"
    end
  end
  resources :teachers, only: [:index, :new, :create, :destroy] do
    member do
      get "asignatures"
    end
  end
  resources :courses, only: [:index, :new, :create, :destroy]
  resources :students, only: [:index, :new, :create, :destroy]  do
    member do
      get "new_calification"
      post "create_calification"
    end
  end


  namespace :api do
    namespace :v1 do
        resources :students, only: [:index]
    end
  end

end
