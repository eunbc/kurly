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

    var cartChkbox = document.getElementsByClassName('cartChkbox')
    for (var i = 0; i < cartChkbox.length; i++) {
        var input = cartChkbox[i]
        input.addEventListener('change', updateCartTotal)
    }
    
    var checkAll = document.getElementById('checkAll');
    checkAll.addEventListener('change',updateCartTotal);

}

function quantityChanged(event) {

    var input = event.target
    if (isNaN(input.value) || input.value <= 0) {
        input.value = 1
    }

	//체크된 항목만 가격정보를 가져옴
	var cartChkbox = $('input[class="cartChkbox"]:checked');    
	var total = 0;    
    for (var i = 0; i < cartChkbox.length; i++) {
	    var gPRICE = Number(document.getElementsByClassName('cart-quantity-input')[i].getAttribute('data-gPRICE'));
	    var gDISCOUNT = Number(document.getElementsByClassName('cart-quantity-input')[i].getAttribute('data-gDISCOUNT'));
	    var cQTY = Number(document.getElementsByClassName('cart-quantity-input')[i].value);
		console.log(document.getElementsByClassName('cart-quantity-input')[i].getAttribute('data-gPRICE'));
		console.log(document.getElementsByClassName('cart-quantity-input')[i].value);
		total = total + (gPRICE * cQTY * (100-gDISCOUNT) * 0.01);
	}
    total = Math.round(total * 100) / 100;
    document.getElementsByClassName('cart-total-price')[0].innerText = numberWithCommas(total);

}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function updateCartTotal() {
	//체크된 항목만 가격정보를 가져옴
	var cartChkbox = $('input[class="cartChkbox"]:checked');    
	var total = 0;    
    for (var i = 0; i < cartChkbox.length; i++) {
    	//원래는 체크박스 안에 data 지정해서 그걸 불러왔는데, 지금은 input(number) 안에 data를 불러주고 있다.
    	//근데 중간 상품을 체크 해제하면 그 중간 상품의 가격이 들어간다.
    	
	    var gPRICE = Number(document.getElementsByClassName('cart-quantity-input')[i].getAttribute('data-gPRICE'));
	    var gDISCOUNT = Number(document.getElementsByClassName('cart-quantity-input')[i].getAttribute('data-gDISCOUNT'));
	    var cQTY = Number(document.getElementsByClassName('cart-quantity-input')[i].value);
		total = total + (gPRICE * cQTY * (100-gDISCOUNT) * 0.01);
	}
    total = Math.round(total * 100) / 100;
    document.getElementsByClassName('cart-total-price')[0].innerText = numberWithCommas(total);
}

