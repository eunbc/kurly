if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready)
} else {
    ready()
}
	
var cart =[];

var Item = function(goIDX, goPRICE, cQTY){
	this.goIDX = goIDX
	this.goPRICE = goPRICE
	this.cQTY = cQTY
};

function ready() {

    var removeCartItemButtons = document.getElementsByClassName('btn-danger')
    for (var i = 0; i < removeCartItemButtons.length; i++) {
        var button = removeCartItemButtons[i]
        button.addEventListener('click', removeCartItem)
    }

    var quantityInputs = document.getElementsByClassName('cart-quantity-input')
    for (var i = 0; i < quantityInputs.length; i++) {
        var input = quantityInputs[i]
        input.addEventListener('change', quantityChanged)
    }

    //document.getElementsByClassName('btn-purchase')[0].addEventListener('click', purchaseClicked)

}

function purchaseClicked() {
    alert('Thank you for your purchase')
    var cartItems = document.getElementsByClassName('cart-items')[0]
    while (cartItems.hasChildNodes()) {
        cartItems.removeChild(cartItems.firstChild)
    }
    updateCartTotal()
}

function removeCartItem(event) {
    var buttonClicked = event.target

	//객체 삭제
	var goIDX = buttonClicked.getAttribute('data-goIDX')
	for(var i in cart) {
		if(cart[i].goIDX == goIDX){
			cart.splice(i,1);
			break;
		}
	}
    buttonClicked.parentElement.parentElement.remove()
    updateCartTotal()
}

function quantityChanged(event) {
    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }
    updateCartTotal()

	var goIDX = input.getAttribute('data-goIDX')

	//수량 변경
	for(var i in cart) {
		if(cart[i].goIDX == goIDX){
			//console.log(input.value);
			cart[i].cQTY = Number(input.value); //여기에 변경된 수량을 넣고 싶음!!
			//console.log(cart[i].cQTY);
			break;
		}
	}
	//console.log(cart);
}

function addItemToCart(goIDX, goNAME, goPRICE) {
    var cartRow = document.createElement('div')
    cartRow.classList.add('cart-row')
    var cartItems = document.getElementsByClassName('cart-items')[0]
    var cartItemNames = cartItems.getElementsByClassName('cart-item-title')
    
	for (var i = 0; i < cartItemNames.length; i++) {
        if (cartItemNames[i].innerText == goNAME) {
            alert('이미 추가한 옵션입니다.')
            return
        }
    }
    var cartRowContents = `
        <div class="cart-item cart-column">
            <span class="cart-item-title">${goNAME}</span>
        </div>
        <span class="cart-price cart-column">${goPRICE}</span>
        <div class="cart-quantity cart-column">
            <input class="cart-quantity-input" type="number" value="1" data-goIDX="${goIDX}">
            <input type="hidden" value="${goIDX}">
            <button class="btn btn-danger" type="button" data-goIDX="${goIDX}">X</button>
        </div>`
    cartRow.innerHTML = cartRowContents
    cartItems.append(cartRow)
    cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', removeCartItem)
    cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', quantityChanged)
	
	//객체 생성
	var item = new Item(goIDX, goPRICE, 1);
	cart.push(item);
	//console.log(cart);
}

function updateCartTotal() {
    var cartItemContainer = document.getElementsByClassName('cart-items')[0]
    var cartRows = cartItemContainer.getElementsByClassName('cart-row')
    var total = 0
    for (var i = 0; i < cartRows.length; i++) {
        var cartRow = cartRows[i]
        var priceElement = cartRow.getElementsByClassName('cart-price')[0]
        var quantityElement = cartRow.getElementsByClassName('cart-quantity-input')[0]
        var price = parseFloat(priceElement.innerText.replace('$', ''))
        var quantity = quantityElement.value
        total = total + (price * quantity)
    }
    total = Math.round(total * 100) / 100
    document.getElementsByClassName('cart-total-price')[0].innerText = total + '원'
}