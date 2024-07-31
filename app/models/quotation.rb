class Quotation < ApplicationRecord
  # Associations
  belongs_to :invoice
  # Validations

  # Callbacks
  before_create :simple_quotation


  def simple_quotation
    quotation_api_service = QuotationApiService.new
    quotation = quotation_api_service.obtain_simple_quotation(self.invoice)
    days = (self.invoice.due_date - Date.today).to_i + 1

    self.request_date = Date.today
    self.document_rate = quotation['document_rate']
    self.commision = quotation['commission']
    self.advance_percentage = quotation['advance_percent']
    self.financing_expense = self.invoice.amount * (quotation['advance_percent'] / 100) * ((quotation['document_rate'] / 100) / 30 * days)
    self.get_amount = (self.invoice.amount * (quotation['advance_percent'] / 100) ) - (self.financing_expense + quotation['commission'])
    self.excess = self.invoice.amount - (self.invoice.amount * (quotation['advance_percent'] / 100) )
  end
end
