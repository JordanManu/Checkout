# frozen_string_literal: true

require_relative 'promotion'

class Checkout
  attr_reader :basket, :promotion

  ITEMS = {
    'Lavender heart' => 9.25,
    'Personalised cufflinks' => 45.00,
    'Kids T-shirt' => 19.95
  }.freeze

  def initialize(promotion)
    @promotion = promotion
    @basket = []
  end

  def scan(item)
    raise 'That item is not available' unless ITEMS.key?(item)

    basket.push(item)
  end

  def remove_item(item)
    delete_item = [item]
    delete_item.each do |del|
      basket.delete_at(basket.index(del))
    end
  end

  def total
    order_total = basket.map { |value| ITEMS.fetch(value) }
    raise 'Your basket is empty' if order_total.sum.zero?

    current_total = if promotion.instance_of?(Promotion)
                      promotion.apply(basket,
                                      order_total.sum)
                    else
                      order_total.sum
                    end
    "£#{format_currency(current_total)}"
  end

  private

  def format_currency(value)
    format('%.2f', value)
  end
end
