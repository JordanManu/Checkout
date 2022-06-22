require 'checkout'

describe Checkout do 
  context "Items" do 
    let (:june_promotion) { 10 }
    let (:co) { Checkout.new(june_promotion) }

    it 'is initialized with an item' do
      expect(Checkout::ITEMS.first).to eq ["Lavender heart", 9.25]
    end

    it 'has prices for each item' do 
      expect(Checkout::ITEMS["Lavender heart"]).to eq 9.25
    end
    it 'has 3 items' do 
      expect(Checkout::ITEMS.count).to eq 3
    end
  end
  context "Scan" do 
    let (:june_promotion) { 10 }
    let (:co) { Checkout.new(june_promotion) }

    it 'adds multiple items to the basket' do 
      co.scan("Lavender heart")
      co.scan("Personalised cufflinks")
      expect(co.basket).to eq ["Lavender heart", "Personalised cufflinks"]
    end
  end

  # context "Discount"
end