Rails.application.routes.draw do
  resources :towns
  resources :states
  resources :ratings
  resources :rating_agencies
  resources :interest_frequencies
  resources :securities
  root 'home#index'
  get 'home/settings'
  get 'home/add_security'
  get 'home/upload_trade_data'
  get 'home/upload_file_path'
  get 'issuers/search'
  get 'analyze/index'

  get '/issuer_security', to: 'securities#issuer_security'
  get '/rating_agency_security', to: 'securities#rating_agency_security'
  resources :security_types
  resources :issuers
  resources :archival_ndsoms

  #file uploading
  post '/file_upload', to: 'home#upload_file', as: 'upload_file'

  #filter by
  get "/filter_by" => "analyze#index"

end
