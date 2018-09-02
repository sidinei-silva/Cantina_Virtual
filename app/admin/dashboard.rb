ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do



    @acompanhamentos = Acompanhamento.all

    render 'admin/pedidos/recents'



  end # content

end
