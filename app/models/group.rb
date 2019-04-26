class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :teams

  validates :title, presence: true
  attr_accessor :team_size

  # processes stripe payment
  def process_payment
    customer = Stripe::Customer.create card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: 5000,
                          description: 'group purchase',
                          currency: 'usd'

  end
end
