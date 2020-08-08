Rails.application.routes.draw do
  resources :interest_frequencies
  resources :securities

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root  'home#index'
  get 'home/settings'
  get 'home/add_security'
  get 'home/upload_trade_data'
  get 'home/upload_file_path'
  get 'issuers/search'
  get 'analyze/index'
  resources :security_types
  resources :issuers
  resources :archival_ndsoms

  #file uploading
  post '/file_upload', to: 'home#upload_file', as: 'upload_file'

  #filter by
  get "/filter_by" => "analyze#index"

  

end
