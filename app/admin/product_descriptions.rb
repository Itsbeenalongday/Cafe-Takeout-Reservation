ActiveAdmin.register ProductDescription do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :price, :description, :avg_producingtime, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:price, :description, :avg_producingtime, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # 
  permit_params :price, :name, :description, :avg_producingtime, :image
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description do |pd|
      pd.body.truncate(20,omission: '...')
    end
    column :avg_producingtime
    column :image
    actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row :description
      row :images do |pd|
        image_tag(pd.image.url)
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :image
    end
    f.actions
   
  end
end
