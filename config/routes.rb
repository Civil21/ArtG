Rails.application.routes.draw do

  root to: 'pages#index'

  resources :artists, except:[:new,:crete,:delete] do
  	resources :arts ,except:[:delete]
  end
  get "arts", to: "arts#index"

  get "artist_sign_in", to:"artists#sign_in", as:"sign_in"
  post "session_up", to:"artists#session_up"
  delete "session_down", to:"artists#session_down"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
