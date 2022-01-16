json.extract! item, :id, :name, :internal_code, :stock, :created_at, :updated_at
json.url item_url(item, format: :json)
