json.extract! cliente, :id, :nome_cliente, :status_cliente, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
