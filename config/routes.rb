Rails.application.routes.draw do
  get "/" => "tops#index"
  get "signup" => "users#signup"
  get "login" => "users#login"
  get "mypage/:id" => "users#show"
  get "menu" => "selects#index"
  get "menu/detail" => "selects#show"
  post "menu/submit" => "selects#submit"
end
