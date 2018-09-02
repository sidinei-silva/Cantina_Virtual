ActiveAdmin.register Acompanhamento do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :nome_acompanhamento, :preco_acompanhamento, :produto_id
  menu priority: 3

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  action_item only: :show do
    link_to 'Voltar', admin_acompanhamentos_path
  end

  form do |form|
    form.semantic_errors *form.object.errors.keys
    form.inputs "Details" do
      form.input :produto_id, :as => :select, :collection => Produto.all.collect {|produto| [produto.nome_produto, produto.id]}
      form.input :nome_acompanhamento
      form.input :preco_acompanhamento, step: 0.1
    end
    form.actions
  end

  show :title => :nome_acompanhamento do
    attributes_table_for acompanhamento.produto do
      row :nome_produto
    end
    attributes_table do
      row :nome_acompanhamento
      row ("Preco acompanhamento") {|acompanhamento| number_to_currency acompanhamento.preco_acompanhamento}
      row :esta_ativo
    end

  end
end
