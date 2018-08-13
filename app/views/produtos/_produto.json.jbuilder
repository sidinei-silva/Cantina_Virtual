json.extract! produto, :id, :nome_produto, :descricao_produto, :preco_produto, :esta_ativo, :created_at, :updated_at
json.url produto_url(produto, format: :json)
