json.extract! item_acompanhamento, :id, :preco_item_acompanhamento, :item_pedido_id, :acompanhamento_id, :created_at, :updated_at
json.url item_acompanhamento_url(item_acompanhamento, format: :json)
