ActiveAdmin.register Article do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :created_at
    column :updated_at
    column :views
    column :user_id
    column :category_id
    column :image_data
    actions
  end

  permit_params :title, :body, :views, user_ids: [], category_id: []


  # permit_params do
  #   permitted = [:title, :body, :views, :user_id, :category_id, :image_data]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
