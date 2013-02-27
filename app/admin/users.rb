ActiveAdmin.register User do
index do
    column :firstname
    column :lastname
    column :email
    column :dateofbirth
    column :adress
    column :city
    column :zip
    column :lock
    default_actions
  end

  form do |f|
f.inputs "User Details" do
f.input :firstname
f.input :lastname
f.input :email
f.input :password
f.input :password_confirmation
f.input :lock
f.input :roles, :label => "Rolle", :as => :check_boxes

end
f.buttons
end
end
