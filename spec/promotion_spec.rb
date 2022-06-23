# frozen_string_literal: true

require 'promotion'
require 'checkout'

describe Promotion do
  let(:promotion) { Promotion.new }
  let(:checkout) { double('checkout') }

  it 'adds a discount of 10% off if the total is over £60' do
    allow(checkout).to receive(:basket).and_return ['Personalised cufflinks', 'Personalised cufflinks']
    allow(checkout).to receive(:total).and_return 90
    expect(promotion.apply(checkout.basket, checkout.total)).to eq 81
  end

  it 'reduces the price of lavender hearts to 8.50 if 2 or more are added' do
    allow(checkout).to receive(:basket).and_return ['Lavender heart', 'Kids T-shirt', 'Lavender heart']
    allow(checkout).to receive(:total).and_return 38.45
    expect(promotion.apply(checkout.basket, checkout.total)).to eq 36.95
  end

  it 'adds multiple discounts to the total' do
    allow(checkout).to receive(:basket).and_return ['Lavender heart', 'Personalised cufflinks', 'Lavender heart',
                                                    'Kids T-shirt']
    allow(checkout).to receive(:total).and_return 83.45
    expect(promotion.apply(checkout.basket, checkout.total)).to eq 73.76
  end
end
