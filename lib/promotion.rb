# frozen_string_literal: true

class Promotion
  def june_promotion(basket, price)
    price -= percentage_discount(price)
    price -= lavender_hearts_discount(basket) if basket.include?('Lavender heart')
    price
  end

  private

  def percentage_discount(price)
    if price > 60
      price * 10 / 100
    else
      0
    end
  end

  def lavender_hearts_discount(basket)
    basket_amount = basket.tally
    if basket_amount['Lavender heart'] >= 2
      basket_amount.fetch('Lavender heart') * 0.75
    else
      0
    end
  end
end
