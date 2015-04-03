Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons 
  put "/pokemon/capture(.:format)", to: "pokemons#capture", as: :capture 
  patch "/pokemon/capture(.:format)" , to: "pokemons#capture"
  patch "/pokemon/:id/damage(.:format)" , to: "pokemons#damage", as: :damage
end

