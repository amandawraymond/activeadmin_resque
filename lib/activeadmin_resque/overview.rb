ActiveAdmin.register_page "Resque Overview" do
  menu parent: 'Resque', priority: 1, label: "Overview"

  content do
    render 'admin/resque/overview'
  end
end