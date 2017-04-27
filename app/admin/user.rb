ActiveAdmin.register User do

  permit_params :email, :company, :first_name, :last_name, :position, :mobile_phone, :office_phone, :email, :address, :description, :radius

  index do
      selectable_column
      column :id
      column :email
      column :first_name
      column :last_name
      column :address
      column :created_at
      column :admin
      actions
    end

  form do |f|
    f.inputs "Identity" do
      f.input :email
    end
    f.inputs "Admin" do
      f.input :admin
    end
    f.actions
  end


# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
