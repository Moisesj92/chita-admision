class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy ]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to invoice_url(@invoice), notice: "Invoice was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      redirect_to invoice_url(@invoice), notice: "Invoice was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy!

    redirect_to invoices_url, notice: "Invoice was successfully destroyed."
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:owner_identification, :recipient_identification, :amount, :invoice_identification, :due_date)
  end
end
