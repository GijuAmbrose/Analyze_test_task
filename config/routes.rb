Rails.application.routes.draw do
  resources :clients
  resources :client_types
  resources :sectors
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
  get 'port_folios/index'

  get '/issuer_security', to: 'securities#issuer_security'
  get '/rating_agency_security', to: 'securities#rating_agency_security'
  get '/filter_for_graph', to: 'analyze#graph_filter'
  get '/sector_client_type', to: 'clients#sector_client_type'
  get '/state_city', to: 'clients#state_city'
  get '/port_folio_filter', to: 'port_folios#index'
  get '/port_folio_client_filter', to: 'port_folios#index'
<<<<<<< HEAD
  get '/port_folio_isin_sort', to: 'port_folios#sort'
  get '/port_folio_isin_select', to: 'port_folios#sort'
=======
>>>>>>> f35f63fc45344e5b809aec59789578c85b2948cd
  resources :security_types
  resources :issuers
  resources :archival_ndsoms

  #file uploading
  post '/file_upload', to: 'home#upload_file', as: 'upload_file'

  #filter by
  get "/filter_by" => "analyze#index"

end
