Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :employees do
        resources :question_answers, only: [ :index, :show, :update ]
      end

      resources :companies do
        resources :question_answers, only: [ :index, :show, :create ]
      end
    end
  end

  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  get "up" => "rails/health#show", as: :rails_health_check

  root to: redirect('/api-docs')
end
