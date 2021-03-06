# == Schema Information
#
# Table name: stripe_payments
#
#  id                     :bigint           not null, primary key
#  community_id           :integer
#  transaction_id         :integer
#  payer_id               :string(255)
#  receiver_id            :string(255)
#  status                 :string(255)
#  sum_cents              :integer
#  commission_cents       :integer
#  currency               :string(255)
#  stripe_charge_id       :string(255)
#  stripe_transfer_id     :string(255)
#  fee_cents              :integer
#  real_fee_cents         :integer
#  subtotal_cents         :integer
#  transfered_at          :datetime
#  available_on           :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  buyer_commission_cents :integer          default(0)
#

class StripePayment < ApplicationRecord
  belongs_to :tx,       class_name: 'Transaction', foreign_key: 'transaction_id', inverse_of: :stripe_payments
  belongs_to :payer,    class_name: 'Person',      foreign_key: 'payer_id',       inverse_of: :payer_stripe_payments
  belongs_to :receiver, class_name: 'Person',      foreign_key: 'receiver_id',    inverse_of: :receiver_stripe_payments

  monetize :sum_cents,        with_model_currency: :currency
  monetize :commission_cents, with_model_currency: :currency
  monetize :fee_cents,        with_model_currency: :currency
  monetize :real_fee_cents,   with_model_currency: :currency, allow_nil: true
  monetize :subtotal_cents,   with_model_currency: :currency
  monetize :buyer_commission_cents, with_model_currency: :currency

  STATUSES = %w(pending paid canceled transfered)
end
