require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def check_product_details(product_name, product_price,product_delivery_price)

        details = find('.item-details h1')
        expect( details.text).to eql product_name
        price = find('.subtotal .sub-price')
        expect( price.text).to eql product_price

        delivery = find('.delivery .delivery-price')
        expect( delivery.text).to eql product_delivery_price
    end

    def assert_total_price(total_price)
        total = find('.total .total-price')
        expect( total.text).to eql total_price
    end

end