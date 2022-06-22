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

  # context "Discount"
end
