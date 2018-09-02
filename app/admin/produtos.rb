ActiveAdmin.register Produto do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  menu priority: 2
  permit_params :nome_produto, :descricao_produto, :preco_produto, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  action_item only: :show do
    link_to 'Voltar', admin_produtos_path
  end

  form do |form|
    form.semantic_errors *form.object.errors.keys
    form.inputs 'Produto' do
      form.input :nome_produto
      form.input :preco_produto, step: 0.1
      form.input :image, as: :file
      form.input :descricao_produto
      form.input :esta_ativo
    end
    form.actions
  end

  show :title => :nome_produto do
    attributes_table do
      row :nome_produto
      row :descricao_produto
      row('Valor produto') { |produto| number_to_currency produto.preco_produto}
      row :esta_ativo
      row :created_at
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
  config.comments = false

end
