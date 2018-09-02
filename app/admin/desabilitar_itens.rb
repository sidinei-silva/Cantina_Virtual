ActiveAdmin.register_page "Desabilitar itens" do
  menu priority: 4
  content title: "Desabilitar Itens" do
    tabs do
      tab :produto do

        render 'admin/desabilitar_itens/desabilitar_produto'
      end

      tab :acompanhamento do
        render 'admin/desabilitar_itens/desabilitar_acompanhamento'
      end
    end
  end
end
