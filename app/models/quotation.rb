class Quotation < ApplicationRecord
  belongs_to :customer
  has_one_attached :pdf_file
end
