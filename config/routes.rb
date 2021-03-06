Rails.application.routes.draw do
  root to: 'api/v1/pings#show'
  get :ping, to: 'api/v1/pings#show'

  namespace :api do
    namespace :v1 do
      post 'feedback' => 'feedbacks#create'
      get 'feedbacks' => 'feedbacks#index'
    end
  end
end
