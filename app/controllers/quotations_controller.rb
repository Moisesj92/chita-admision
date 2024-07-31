class QuotationsController < ApplicationController
  def create
    @invoice = Invoice.find(params[:invoice_id])
    @quotation = @invoice.quotations.new()

    if @quotation.save
      redirect_to invoice_url(@quotation.invoice), notice: "Quotation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
end
