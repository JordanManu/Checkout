# frozen_string_literal: true

require 'checkout'
require 'promotion'

describe Checkout do
  context 'Items' do
    let(:promotion) { double('promotion') }
    let(:co) { Checkout.new(promotion) }

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
    let(:promotion) { double('promotion') }
    let(:co) { Checkout.new(promotion) }

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

  context 'Total' do
    it 'returns the correct total' do
      promotion = double('promotion')
      co = Checkout.new(promotion)
      allow(promotion).to receive(:apply).and_return 36.95
      allow(promotion).to receive(:instance_of?).with(Promotion).and_return(true)

      co.scan('Lavender heart')
      co.scan('Kids T-shirt')
      co.scan('Lavender heart')
      expect(co.total).to eq '£36.95'
    end
  end

  context 'No promotion' do
    it 'returns the total if no promotion is given' do
      co = Checkout.new('No promotion')
      co.scan('Lavender heart')
      co.scan('Kids T-shirt')
      co.scan('Lavender heart')
      expect(co.total).to eq '£38.45'
    end
  end

  context 'Promotion'
  it 'receives apply when total is called' do
    promotion = double('promotion')
    co = Checkout.new(promotion)
    allow(promotion).to receive(:apply).and_return 9.25
    allow(promotion).to receive(:instance_of?).with(Promotion).and_return(true)

    co.scan('Lavender heart')
    co.total
    expect(promotion).to have_received(:apply)
  end
end
