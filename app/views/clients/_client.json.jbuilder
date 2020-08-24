json.extract! client, :id, :name, :address, :pin, :phone, :email, :website, :aum, :subdomain, :created_at, :updated_at
json.url client_url(client, format: :json)
