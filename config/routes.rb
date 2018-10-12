Rails.application.routes.draw do

  root to: 'pages#index'

  get "session", to:"artists#sign_in"
  post "session", to:"artists#session_up"
  delete "session", to:"artists#session_down"

  get "arts", to: "arts#index"

  resources :artists, except:[:destroy] do
  	resources :arts ,except:[:destroy]
  end

  resources :categories, except:[:new,:create,:update,:edit,:destroy]
  resources :category_groups, except:[:new,:create,:update,:edit,:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
