
Dado('que iniciei a compra do item {string}') do |product_name|
    @home.buy_coffee(product_name)
end

Quando('faço a busca do seguinte CEP: {string}') do |zipcode|
    @checkout.zipcode_search(zipcode)
end

Quando('informo os demais dados do endereço:') do |table|
    address = table.rows_hash
    @checkout.fill_address(address[:Numero], address[:Complemento])
end

Quando('escolho a forma de pagamento {string}') do |string|
    @checkout.select_paymentMethod(string)
end

Quando('por fim finalizo a compra') do
    @checkout.buy
end

Então('sou redirecionado para a página de confirmação de Pedido') do
    @order.assert_order
end

Então('deve ser informado o seguinte prazo de entrega: {string}') do |string|
    @order.asser_delivery_time(string)
end
  
  