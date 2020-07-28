json.extract! security, :id, :security_name, :isin, :issue_date, :maturity_date, :outstanding_stock, :face_value, :coupon_rate, :created_at, :updated_at
json.url security_url(security, format: :json)
