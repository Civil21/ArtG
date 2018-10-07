Rails.application.routes.draw do
  
  get 'arts/show'

  root to: 'pages#index'

  resources :artists do
  	resources :arts ,except:[:index,:delete]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
