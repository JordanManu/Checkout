# Checkout 

## Specification

* Requirements
  * [X] You should be able to interact with your code via a REPL like IRB
  * [X] Discount of 10% given if total is over £60
  * [X] Discount given if two or more Lavender hearts are ordered

## Test data
```
Basket: Lavender heart, Personalised cufflinks, Kids T-Shirt
Total price expected: £66.78

Basket: Lavender heart, Kids T-Shirt, Lavender heart
Total price expected: £36.95

Basket: Lavender heart, Personalised cufflinks, Lavender heart, Kids T-Shirt, 
Total price expected: £73.76
```

## Screenshots of the program

![Screenshot](https://imgur.com/Foc1CZk.png)

## How to use

* Clone this repo to your local machine with ```git clone https://github.com/JordanManu/Checkout```
* Run ```bundle install``` to install gems
* To run the tests using Rspec, and to check the test coverage, you can run the command ```rspec``` in your terminal
* To check the quality of the code, use the command ```rubocop``` to run rubocop
* To use the program, start by opening irb in your terminal
* To load the program into irb use the command ```load './lib/checkout.rb' ```
* Start by creating an instance of the Promotion class with ```promotion = Promotion.new```
* Then creating an instance of the Checkout class with ```co = Checkout.new(promotion)```
* To scan an item (add items to the basket), use ```co.scan(item)```
* To see the total amount of the items, use ```co.total```
* To remove an item from the basket, use ```co.remove_item(item)```

## My approach

- My approach to this challenge was to first start with a TDD approach to create simple and effective code.
- I started by having one Checkout class, then after I got that completed and working, I separated it into two classes - Checkout and Promotion. I did this so that the promotions would be easier to change and update, without affecting the Checkout class.
The Checkout class is responsible for handling the items, and the Promotion class is responsible for calculating the discount.