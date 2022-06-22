require 'checkout'

describe Checkout do 
  context "items" do 
    let (:june_promotion) { 10 }
    let (:co) { Checkout.new(june_promotion) }

    it 'is initialized with an item' do
      expect(Checkout::ITEMS).to eq "Lavender heart" => 9.25
    end

    it 'has prices for each item' do 
      expect(Checkout::ITEMS["Lavender heart"]).to eq 9.25
    end
  end
end