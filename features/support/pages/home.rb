

class HomePage
include Capybara::DSL

    def open
        visit 'https://starbugs.vercel.app/'
    end

    def all_coffees
        return all('.coffee-item') 
    end

    def buy_coffee(coffee_name)
        product = find('.coffee-item', text:coffee_name)
        product.find('.buy-coffee').click
    end
end