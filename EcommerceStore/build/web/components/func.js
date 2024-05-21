console.log("Hello World")

document.getElementById("cartBtn").addEventListener('click', showCart) 
document.getElementById("cart_close_btn").addEventListener('click', showCart) 

function showCart(e) {
    let cartBar = document.getElementById("cartBar");
    if (e.srcElement.id == "cartBtn") {
        cartBar.style.transform = "translateX(0px)"
    } else if (e.srcElement.id == "cart_close_btn") {
        cartBar.style.transform = "translateX(550px)"
    }
    
}