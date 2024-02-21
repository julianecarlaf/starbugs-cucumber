#language: pt 

Funcionalidade: Uso do Cupons no Checkout

    Como um usuário da StarBugs, Eu quero poder aplicar cupons de desconto na página de checkout.
    Para que eu possa obter reduções no preço de produtos específicos, aumentando a satisfação com a minha experiência de compra.

Cenário: Aplicar desconto de 20%

    Dado que estou na página de checkout 
        E o item que está no meu carrinho é o Café com leite no valor de R$ 19.99
        E que a taxa de entrega é de R$ 10.00 
        E que tenho um cupom com 20% de desconto
    Quando aplico o cupom de desconto
    Então o desconto de 20% deve ser aplicado apenas no valor do Café com leite
        E o valor final da compra deve ser atualizado para R$ 25.99