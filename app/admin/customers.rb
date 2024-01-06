ActiveAdmin.register Customer do
  permit_params :name, :email, :phone
end