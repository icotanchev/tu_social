TuSocial::Application.routes.draw do
  root to: 'topics#index'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  resources :messages do
    collection do
      get 'send/new', action: :new
      get 'sent'
      get 'received'
    end
  end

  resources :marks, only: [:index] do
    collection do
      get 'new_mark'
    end
  end

  mount Resque::Server, :at => '/resque'

  resources :users do
    collection do
      get 'teachers'
    end
  end

  resources :subjects do
    resources :comments
  end
  
  resources :topics do
    resources :comments
  end
end
