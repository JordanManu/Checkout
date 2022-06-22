class Checkout 

  attr_reader :basket
 
  ITEMS = {
    "Lavender heart" => 9.25, 
    "Personalised cufflinks" => 45.00,
    "Kids T-shirt" => 19.95
  }

  def initialize(promotional_rules)
    @basket = []
  end
  
  def scan(item)
    @basket.push(item)
  end
end