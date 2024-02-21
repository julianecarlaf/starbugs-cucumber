Quando('acesso a página principal da StarBugs') do
    @home.open
   
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
  # products =  all('.coffee-item') #seletor CSS - All trabalha com uma lista de elementos
   expect(@home.all_coffees.size).to be > 0
   # Rpec responsável pelos asserts
end

Dado('que estou na página principal da StarBugs') do
    @home.open
end
  
Dado('que desejo comprar o café {string}') do |product_name|
    @product_name = product_name
end

Dado('que esse produto custa {string}') do |product_price|
   @product_price = product_price
end

Dado('que o custo de entrega é de {string}') do |product_delivery_price|
    @product_delivery_price = product_delivery_price
end

Dado('que desejo comprar o seguinte produto:') do |table|
    @product_name =  table.hashes[0][:product]
    @product_price = table.hashes[0][:price]
    @product_delivery_price = table.hashes[0][:delivery]

  end
  

Quando('inicio a compra desse item') do
   @home.buy_coffee(@product_name)
 
end

Então('devo ver a página de checkout com os detalhes do produto') do
    @checkout.check_product_details(@product_name,@product_price,@product_delivery_price)
    
end

Então('o valor total da compra deve ser de {string}') do |total_service|
   @checkout.assert_total_price(total_service)
end

Então('devo ver um popup informando que o produto está indisponível') do
    popup = find ('.swal2-show #swal2-html-container')
    expect(popup.text).to eql 'Produto indisponível'
end
  
  
  