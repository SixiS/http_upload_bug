Rails.application.routes.draw do
  resources :file_upload
  root "file_upload#index"
end
