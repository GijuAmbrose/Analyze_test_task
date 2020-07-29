Rails.application.routes.draw do
  resources :interest_frequencies
  resources :securities
  root 'home#index'
  get 'home/settings'
  get 'home/add_security'
  get 'home/upload_trade_data'
  get 'home/analyze'
  get 'home/upload_file_path'
  get 'issuers/search'
  resources :security_types
  resources :issuers
  resources :archival_ndsom

  #file uploading
  post '/file_upload', to: 'home#upload_file', as: 'upload_file'

  #filter by
  get "/filter_by" => "home#analyze"

end
