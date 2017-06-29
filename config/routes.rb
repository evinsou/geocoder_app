Rails.application.routes.draw do
  get 'geocode(/:search)' => 'home#geocode', :defaults => { :format => 'json' }
  root to: 'home#index'
end
