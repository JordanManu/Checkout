# frozen_string_literal: true

require_relative 'promotion'

class Checkout
  attr_reader :basket

  ITEMS = {
    'Lavender heart' => 9.25,
    'Personalised cufflinks' => 45.00,
    'Kids T-shirt' => 19.95
  }.freeze

  def initialize(promotion = Promotion.new)
    @promotion = promotion
    @basket = []
  end

  def scan(item)
    raise 'That item is not available' unless ITEMS.key?(item)

    @basket.push(item)
  end

  def remove_item(item)
    @basket.delete(item)
  end

  def total
    @basket = basket
    order_total = @basket.map { |value| ITEMS.fetch(value) }
    current_total = @promotion.june_promotion(basket, order_total.sum)
    "£#{format_currency(current_total)}"
  end

  private

  def format_currency(value)
    format('%.2f', value)
  end
end
