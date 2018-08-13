json.extract! pedido, :id, :status_pedido, :total_pedido, :cliente_id, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
