
class QuotationApiService
  def initialize
    @conn = Faraday.new(
      url: ENV.fetch('QUOTATION_API_URL'),
      headers: {
        'X-Api-Key' => ENV.fetch('QUOTATION_API_KEY')
      }
    )
  end

  def obtain_simple_quotation(invoice)
    params = {
      'client_dni' => invoice.owner_identification,
      'debtor_dni' => invoice.recipient_identification,
      'document_amount' => invoice.amount.to_f,
      'folio' => invoice.invoice_identification,
      'expiration_date' => invoice.due_date.to_s
    }

    response = @conn.get('pricing/simple_quote', params)

    if response.status == 200
      JSON.parse(response.body)
    else
      raise "Error in Quotation API: #{response.body}"
    end
  end
end
