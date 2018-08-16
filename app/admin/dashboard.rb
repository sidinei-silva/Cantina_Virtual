ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do

    panel 'Recent Orders' do

      table_for Pedido.all.order('id desc').limit(1) do
        column 'Id do pedido', :id
        column 'Cliente', :cliente, :nome_cliente
        column 'Data do pedido', :created_at
        column('Status') {|pedido| status_tag(pedido.status_pedido)}
        column('Total pedido') {|pedido| number_to_currency pedido.total_pedido}

      end
    end
    panel 'Recente 2' do
      render 'admin/pedidos/recents'
    end



    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Pedido.recents(5).map do |pedido|
    #           li link_to(pedido.cliente.nome_cliente, admin_pedido_path(pedido))
    #         end
    #       end
    #     end
    #   end
    #
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content

end
