require 'resturant'

describe Resturant do

  subject(:resturant) {described_class.new}

  context "#show_menu" do
    it "displays a list of dishes and prices" do
      expect(resturant.show_menu).to_not be_empty
    end
  end

  context "#add_to_cart" do

    it "allows customer to choose a dish and quantity" do
      expect{resturant.add_to_cart(name: :lamp_chops, quantity: 1)}.to_not raise_error
    end

    it "raises an error if name or quantity is missing" do
      error_message = "Please provide a hash with ':name' and ':quantity' as keys"
      expect{resturant.add_to_cart(name: :lamp_chops)}.to raise_error error_message
      expect{resturant.add_to_cart(quantity: 1)}.to raise_error error_message
    end

    it "raises an error if chosen dish is not on the menu" do
      error_message = "Sorry, chosen item not on the menu"
      expect{resturant.add_to_cart(name: "lamp chops", quantity: 2)}. to raise_error error_message
    end

  end

  context "#confirm_order" do
    it "displays the order and total" do
      resturant.add_to_cart(name: :lamp_chops, quantity: 1)
      resturant.add_to_cart(name: :naan, quantity: 2)
      expect(resturant.confirm_order(12.9)).to eq "1. Lamp_chops\t1 Qty\t£7.0 EA\n2. Naan\t2 Qty\t£2.95 EA\nYour total is £12.90."
    end

    it "raises an error if called before placing an order" do
      error_message = "Sorry, Please place an order first"
      expect{resturant.confirm_order(12)}.to raise_error error_message
    end
  end
end