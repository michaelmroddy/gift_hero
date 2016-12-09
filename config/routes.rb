Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "gift_occasion#index"
  # Routes for the Role resource:
  # CREATE
  get "/roles/new", :controller => "roles", :action => "new"
  post "/create_role", :controller => "roles", :action => "create"

  # READ
  get "/roles", :controller => "roles", :action => "index"
  get "/roles/:id", :controller => "roles", :action => "show"

  # UPDATE
  get "/roles/:id/edit", :controller => "roles", :action => "edit"
  post "/update_role/:id", :controller => "roles", :action => "update"

  # DELETE
  get "/delete_role/:id", :controller => "roles", :action => "destroy"
  #------------------------------

  # Routes for the Review_comment resource:
  # CREATE
  get "/review_comments/new", :controller => "review_comments", :action => "new"
  post "/create_review_comment", :controller => "review_comments", :action => "create"

  # READ
  get "/review_comments", :controller => "review_comments", :action => "index"
  get "/review_comments/:id", :controller => "review_comments", :action => "show"

  # UPDATE
  get "/review_comments/:id/edit", :controller => "review_comments", :action => "edit"
  post "/update_review_comment/:id", :controller => "review_comments", :action => "update"

  # DELETE
  get "/delete_review_comment/:id", :controller => "review_comments", :action => "destroy"
  #------------------------------

  # Routes for the Receiver_interest resource:
  # CREATE
  get "/receiver_interests/new", :controller => "receiver_interests", :action => "new"
  post "/create_receiver_interest", :controller => "receiver_interests", :action => "create"

  # READ
  get "/receiver_interests", :controller => "receiver_interests", :action => "index"
  get "/receiver_interests/:id", :controller => "receiver_interests", :action => "show"

  # UPDATE
  get "/receiver_interests/:id/edit", :controller => "receiver_interests", :action => "edit"
  post "/update_receiver_interest/:id", :controller => "receiver_interests", :action => "update"

  # DELETE
  get "/delete_receiver_interest/:id", :controller => "receiver_interests", :action => "destroy"
  #------------------------------

  # Routes for the Interest resource:
  # CREATE
  get "/interests/new", :controller => "interests", :action => "new"
  post "/create_interest", :controller => "interests", :action => "create"

  # READ
  get "/interests", :controller => "interests", :action => "index"
  get "/interests/:id", :controller => "interests", :action => "show"

  # UPDATE
  get "/interests/:id/edit", :controller => "interests", :action => "edit"
  post "/update_interest/:id", :controller => "interests", :action => "update"

  # DELETE
  get "/delete_interest/:id", :controller => "interests", :action => "destroy"
  #------------------------------

  # Routes for the Gift_recommendation resource:
  # CREATE
  get "/gift_recommendations/new", :controller => "gift_recommendations", :action => "new"
  post "/create_gift_recommendation", :controller => "gift_recommendations", :action => "create"

  # READ
  get "/gift_recommendations", :controller => "gift_recommendations", :action => "index"
  get "/gift_recommendations/:id", :controller => "gift_recommendations", :action => "show"

  # UPDATE
  get "/gift_recommendations/:id/edit", :controller => "gift_recommendations", :action => "edit"
  post "/update_gift_recommendation/:id", :controller => "gift_recommendations", :action => "update"

  # DELETE
  get "/delete_gift_recommendation/:id", :controller => "gift_recommendations", :action => "destroy"
  #------------------------------

  # Routes for the Gift_occasion_type resource:
  # CREATE
  get "/gift_occasion_types/new", :controller => "gift_occasion_types", :action => "new"
  post "/create_gift_occasion_type", :controller => "gift_occasion_types", :action => "create"

  # READ
  get "/gift_occasion_types", :controller => "gift_occasion_types", :action => "index"
  get "/gift_occasion_types/:id", :controller => "gift_occasion_types", :action => "show"

  # UPDATE
  get "/gift_occasion_types/:id/edit", :controller => "gift_occasion_types", :action => "edit"
  post "/update_gift_occasion_type/:id", :controller => "gift_occasion_types", :action => "update"

  # DELETE
  get "/delete_gift_occasion_type/:id", :controller => "gift_occasion_types", :action => "destroy"
  #------------------------------

  # Routes for the Gift_occasion resource:
  # CREATE
  get "/gift_occasions/new", :controller => "gift_occasions", :action => "new"
  post "/create_gift_occasion", :controller => "gift_occasions", :action => "create"

  # READ
  get "/gift_occasions", :controller => "gift_occasions", :action => "index"
  get "/gift_occasions/:id", :controller => "gift_occasions", :action => "show"

  # UPDATE
  get "/gift_occasions/:id/edit", :controller => "gift_occasions", :action => "edit"
  post "/update_gift_occasion/:id", :controller => "gift_occasions", :action => "update"

  # DELETE
  get "/delete_gift_occasion/:id", :controller => "gift_occasions", :action => "destroy"
  #------------------------------

  # Routes for the Relation_type resource:
  # CREATE
  get "/relation_types/new", :controller => "relation_types", :action => "new"
  post "/create_relation_type", :controller => "relation_types", :action => "create"

  # READ
  get "/relation_types", :controller => "relation_types", :action => "index"
  get "/relation_types/:id", :controller => "relation_types", :action => "show"

  # UPDATE
  get "/relation_types/:id/edit", :controller => "relation_types", :action => "edit"
  post "/update_relation_type/:id", :controller => "relation_types", :action => "update"

  # DELETE
  get "/delete_relation_type/:id", :controller => "relation_types", :action => "destroy"
  #------------------------------

  # Routes for the Gift_receiver resource:
  # CREATE
  get "/gift_receivers/new", :controller => "gift_receivers", :action => "new"
  post "/create_gift_receiver", :controller => "gift_receivers", :action => "create"

  # READ
  get "/gift_receivers", :controller => "gift_receivers", :action => "index"
  get "/gift_receivers/:id", :controller => "gift_receivers", :action => "show"

  # UPDATE
  get "/gift_receivers/:id/edit", :controller => "gift_receivers", :action => "edit"
  post "/update_gift_receiver/:id", :controller => "gift_receivers", :action => "update"

  # DELETE
  get "/delete_gift_receiver/:id", :controller => "gift_receivers", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  get "/approve_gift_recommendations/:id", :controller =>"gift_recommendations", :action => "approve"
  get "/reject_gift_recommendations/:id", :controller =>"gift_recommendations", :action => "reject"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
