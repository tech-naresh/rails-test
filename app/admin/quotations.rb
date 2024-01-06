ActiveAdmin.register Quotation do
  permit_params :customer_id, :amount, :currency, :description, :pdf_file

  form do |f|
    f.inputs 'Quotation Details' do
      f.input :customer_id, as: :select, collection: Customer.all, input_html: { class: 'chosen-input' }, include_blank: 'Select a Customer'
      f.input :amount
      f.input :amount
      f.input :currency
      f.input :description
      f.input :pdf_file, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :customer
    column :amount
    column :currency
    column :description
    column :pdf_file do |quotation|
      if quotation.pdf_file.attached?
        link_to 'PDF', rails_blob_path(quotation.pdf_file, disposition: 'attachment')
      else
        'No PDF available'
      end
    end
    actions
  end

  scope :all, default: true
end
