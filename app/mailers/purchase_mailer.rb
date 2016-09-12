class PurchaseMailer < ApplicationMailer
  before_action :add_inline_attachments!

  def pending_transfer_payment(purchase)
    @purchase = purchase
    @bank_account = BankAccount.first
    mail to: @purchase.user.email, subject: 'Pague sua compra e envie o comprovante'
  end

  def pending_payment(purchase)
    @purchase = purchase
    mail to: @purchase.user.email, subject: 'Compra pendente de pagamento'
  end

  def confirmed_payment(purchase)
    @purchase = purchase
    mail to: @purchase.user.email, subject: 'Compra confirmada'
  end

  private

  def add_inline_attachments!
    attachments.inline['logo.png'] =
      Rails.root.join('app/assets/images/logo-triboviva.png').read
  end
end
