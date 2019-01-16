Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require "sidekiq/web"
  require "sidekiq/cron/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
  end

  resources :requests do
    member do
      get :confirm_email
      get :confirm_request
    end
  end

end


# ROUTES

#                   Prefix Verb   URI Pattern                                Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                   devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                   devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                  devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)              devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)             devise/passwords#edit
#            user_password PATCH  /users/password(.:format)                  devise/passwords#update
#                          PUT    /users/password(.:format)                  devise/passwords#update
#                          POST   /users/password(.:format)                  devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)                    devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)                   devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                      devise/registrations#edit
#        user_registration PATCH  /users(.:format)                           devise/registrations#update
#                          PUT    /users(.:format)                           devise/registrations#update
#                          DELETE /users(.:format)                           devise/registrations#destroy
#                          POST   /users(.:format)                           devise/registrations#create

#                     root GET    /                                          pages#home

#                 requests GET    /requests(.:format)                        requests#index
#                          POST   /requests(.:format)                        requests#create
#              new_request GET    /requests/new(.:format)                    requests#new
#             edit_request GET    /requests/:id/edit(.:format)               requests#edit
#                  request GET    /requests/:id(.:format)                    requests#show
#                          PATCH  /requests/:id(.:format)                    requests#update
#                          PUT    /requests/:id(.:format)                    requests#update
#                          DELETE /requests/:id(.:format)                    requests#destroy
#    confirm_email_request GET    /requests/:id/confirm_email(.:format)      requests#confirm_email
#  confirm_request_request GET    /requests/:id/confirm_request(.:format)    requests#confirm_request
