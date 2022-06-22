# frozen_string_literal: true
require 'byebug'

class Checkout
  attr_reader :basket

  ITEMS = {
    'Lavender heart' => 9.25,
    'Personalised cufflinks' => 45.00,
    'Kids T-shirt' => 19.95
  }.freeze

  def initialize(current_promotion)
    @current_promotion = current_promotion
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
    order_total = @basket.map { |value| ITEMS.fetch(value) }
    current_total = apply_discount(order_total.sum)
    return '£' + format_currency(current_total)
  end

  def apply_discount(price)
    price -= percentage_discount(price)
    if @basket.include?('Lavender heart')
      price -= lavender_hearts_discount
    end
    return price
  end

  private 

  def percentage_discount(price)
    if price > 60
      price * @current_promotion / 100
    else
      0
    end
  end

  def lavender_hearts_discount
    basket_amount = @basket.tally 
    if basket_amount['Lavender heart'] >= 2
      basket_amount.fetch('Lavender heart') * 0.75
    else
      0
    end
  end
 
  def format_currency(value)
    format('%.2f', value)
  end

end
