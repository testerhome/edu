Testerhome::Edu::Engine.routes.draw do
  resources :training_courses
  get :teacher_cooperate, to: "training_courses#teacher_cooperate", as: "teacher_cooperate"
  get :business_cooperate, to: "training_courses#business_cooperate", as: "business_cooperate"

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
  namespace :manage do
    get :edit_setting, to: "training_courses#edit_setting", as: "edit_setting"
    post :update_setting, to: "training_courses#update_setting", as: "update_setting"
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
