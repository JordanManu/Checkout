# frozen_string_literal: true

require 'checkout'

describe Checkout do

  context 'Items' do
    let(:june_promotion) { 10 }
    let(:co) { Checkout.new(june_promotion) }

    it 'is initialized with an item' do
      expect(Checkout::ITEMS.first).to eq ['Lavender heart', 9.25]
    end

    it 'has prices for each item' do
      expect(Checkout::ITEMS['Lavender heart']).to eq 9.25
    end
    it 'has 3 items' do
      expect(Checkout::ITEMS.count).to eq 3
    end
  end

  context 'Scan items' do
    let(:june_promotion) { 10 }
    let(:co) { Checkout.new(june_promotion) }

    it 'adds multiple items to the basket' do
      co.scan('Lavender heart')
      co.scan('Personalised cufflinks')
      expect(co.basket).to eq ['Lavender heart', 'Personalised cufflinks']
    end

    it 'raises an error if user selects an item that is not available' do
      expect { co.scan('Mens T-shirt') }.to raise_error 'That item is not available'
    end

    it 'allows user to remove an item from the basket' do 
      co.scan('Lavender heart')
      co.scan('Personalised cufflinks')
      co.remove_item('Personalised cufflinks')
      expect(co.basket).not_to include 'Personalised cufflinks'
    end
  end

  context "Discount" do 
    let(:june_promotion) { 10 }
    let(:co) { Checkout.new(june_promotion) }

    it 'adds a discount of 10% off if the total is over £60' do
      co.scan('Personalised cufflinks')
      co.scan('Personalised cufflinks')
      expect(co.total).to eq '£81.00'
    end

    it 'reduces the price of lavender hearts to 8.50 if 2 or more are added' do
      co.scan('Lavender heart')
      co.scan('Kids T-shirt')
      co.scan('Lavender heart')
      expect(co.total).to eq '£36.95'
    end
    it 'adds multiple discounts to the total' do
      co.scan('Lavender heart')
      co.scan('Personalised cufflinks')
      co.scan('Lavender heart')
      co.scan('Kids T-shirt')
      expect(co.total).to eq '£73.60'
    end
  end

  
end
