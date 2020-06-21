Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
         get "/mask",to: "mask#index"
    end
  end
end
