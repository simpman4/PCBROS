/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let carts = document.querySelectorAll('.add-cart');
let products = [
{
    name: 'Laptop',
    tag: 'laptop',
    price: 3000,
    inCart: 0
    
},
{
    name: 'Headphones',
    tag: 'headpones',
    price: 50,
    inCart: 0
    
},
{
    name: 'Keyboard',
    tag: 'keyboard',
    price: 20,
    inCart: 0
    
},
{
    name: 'Xbox',
    tag: 'xbox',
    price: 120,
    inCart: 0
    
}
];

for (let i=0; i< carts.length; i++) {
    carts[i].addEventListener('click',()=>{
        cartNumbers();
    });
    
}

function cartNumbers(){
    let productNumbers = localStorage.getItem('CartNumbers');
    
    productNumbers = parseInt(productNumbers);
    
    if(productNumbers){
 localStorage.setItem('cartNumbers', productNumbers + 1);
 document.querySelector('.cart span').textContent = productNumbers + 1;

   }else{
localStorage.setItem('cartNumbers', 1);
document.querySelector('.cart span').textContent = 1;
   }

    
}