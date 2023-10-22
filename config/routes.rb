Testerhome::Edu::Engine.routes.draw do
  resources :training_courses
  namespace :admin do
    resources :training_courses do
      member do
        post :undestroy
        post :suggest
        post :unsuggest
        post :publish
        post :unpublish
      end
    end
  end
end
