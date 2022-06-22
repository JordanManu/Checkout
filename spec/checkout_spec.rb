require 'checkout'

describe Checkout do 
  it 'is initialized with an item' do
    june_promotion = 10
    co = Checkout.new(june_promotion)
    expect(co.items).to eq "Lavender heart"
  end
end