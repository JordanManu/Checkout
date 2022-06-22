# frozen_string_literal: true

class Checkout
  attr_reader :basket

  ITEMS = {
    'Lavender heart' => 9.25,
    'Personalised cufflinks' => 45.00,
    'Kids T-shirt' => 19.95
  }.freeze

  def initialize(_promotional_rules)
    @basket = []
  end

  def scan(item)
    raise 'That item is not available' unless ITEMS.key?(item)

    @basket.push(item)
  end

  def remove_item(item)
    @basket.delete(item)
  end
end
