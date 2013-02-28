ActiveAdmin.register User do
index do
    column :firstname
    column :lastname
    column :email
    column :dateofbirth
    column :adress
    column :city
    column :zip
    column :failed_attempts
    column :locked_at
    
    default_actions
  end

  form do |f|
f.inputs "User Details" do
f.input :firstname
f.input :lastname
f.input :email
f.input :password
f.input :failed_attempts
f.input :locked_at
f.input :roles, :label => "Rolle", :as => :check_boxes

end
f.buttons
end
end
