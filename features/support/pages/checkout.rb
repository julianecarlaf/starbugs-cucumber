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

    def zipcode_search(zipcode)
        find('input[name=cep]').set(zipcode)
        find('.button-cep ').click
    end

    def fill_address(number, details)
        find('input[name=number]').set(number)
        find('input[name=complement]').set(details)
    end

    def select_paymentMethod(paymentMethod)
        #Se quisesse usar Xpath para encontrar o texto de um label
        #//label//div[text()="Cartão de Crédito"]
        #find('label div', text: "Cartão de Crédito")

        find('label div', text: paymentMethod.upcase).click
    end

    def buy 
        click_on "Confirmar pedido"
    end

end