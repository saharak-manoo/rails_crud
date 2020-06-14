Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'students#index'

  resources :students do
    # member ก็คือจะได้ path /students/:id/:new_path
    member do
      post 'add_course'
    end
  end
end
