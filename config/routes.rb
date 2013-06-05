Loginsystem::Application.routes.draw do

  scope 'anmeldesystem' do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users do
    resources :events do      
      resources :registrations
      get 'duplicate' => :duplicate
      post 'duplicate' => :create_double
      get 'invert_locked' => :invert_locked
      get 'refresh_questions' => :refresh_questions
      resources :questions do
        resources :text_questions, :bool_questions, :opt_questions
        get 'position_down' => :position_down
        get 'position_up' => :position_up
      end
    end
  end
  
  resources :text_answers, :bool_answers, :opt_answers
  
  controller :registrations do
    get 'anmeldung/:id' => :new
    post 'anmeldung' => :create
  end

  root :to => 'sessions#new'

  end
end
