require 'rspec'


class OrderClass
    include Capybara::DSL
    include RSpec::Matchers

    def assert_order
      expect( find('h1').text ).to eql 'Uhull! Pedido confirmado'
      expect( find('p[color=subtitle]').text).to eql 'Agora é só aguardar que logo o café chegará até você'
    end

    def asser_delivery_time(time)
       delivery_time = find('p', text:'Previsão de entrega')
       expect(delivery_time.find('strong').text).to eql time
      end

end