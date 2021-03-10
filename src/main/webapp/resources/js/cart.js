if (document.readyState == 'loading') {
    document.addEventListener('DOMContentLoaded', ready)
} else {
    ready()
}
	
var order =[];

var Item = function(gIDX,goIDX, odQTY, gPRICE, gDISCOUNT){
	this.gIDX = gIDX
	this.goIDX = goIDX
	this.odQTY = odQTY
	this.gPRICE = gPRICE
	this.gDISCOUNT = gDISCOUNT
};


function addItemToOrder(gIDX,goIDX,odQTY,gPRICE,gDISCOUNT){
	var item = new Item(gIDX,goIDX,odQTY,gPRICE,gDISCOUNT);
	order.push(item);
}

function ready() {

    var cartChkbox = document.getElementsByClassName('cartChkbox')
    for (var i = 0; i < cartChkbox.length; i++) {
        var input = cartChkbox[i]
        input.addEventListener('change', updateMyCartPrice);
    }
    
    var getOrder = document.getElementById('getOrder');
    getOrder.addEventListener('click',letsOrder);
    
}

function letsOrder() {

	var cartChkbox = $('.cartChkbox:checked');    
	
	if(cartChkbox.length==0) {
		alert("장바구니에 담긴 품목이 없습니다.");
		return false;
	}
	var ans = confirm('주문하시겠습니까? 주문 페이지로 이동합니다.');
	if(!ans) return;
	
	//체크된 항목만 로컬 저장소에 저장
    for (var i = 0; i < cartChkbox.length; i++) {
    	var gIDX = Number(cartChkbox[i].getAttribute('data-gIDX')); 
    	var goIDX = Number(cartChkbox[i].getAttribute('data-goIDX')); 
    	var cQTY = Number(cartChkbox[i].getAttribute('data-cQTY'));
    	var gPRICE = Number(cartChkbox[i].getAttribute('data-gPRICE')); 
    	var gDISCOUNT = Number(cartChkbox[i].getAttribute('data-gDISCOUNT')); 
    	
		addItemToOrder(gIDX,goIDX,cQTY,gPRICE,gDISCOUNT);
    	localStorage.setItem('order',JSON.stringify(order));
	}
	
	if($("#sample6_postcode").val()!=''){
	    var tempADDRESS = "["+$("#sample6_postcode").val()+"]"+$("#sample6_address").val()+" "+$("#sample6_detailAddress").val()+" "+$("#sample6_extraAddress").val();
		$('#tempADDRESS').val(tempADDRESS);
		
		localStorage.setItem('tempAddress',$('#tempADDRESS').val());
	}
	location.href='orderForm';
	
}


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function updateMyCartPrice() {

	//체크된 항목만 가격정보를 가져옴
	var cartChkbox = $('.cartChkbox:checked');    
	var total = 0;    
	var discount = 0;    
	var delivery = 0;    
	var finalTotal = 0;    
    for (var i = 0; i < cartChkbox.length; i++) {
    	var gIDX = Number(cartChkbox[i].getAttribute('data-gIDX')); 
    	var goIDX = Number(cartChkbox[i].getAttribute('data-goIDX')); 
    	var cQTY = Number(cartChkbox[i].getAttribute('data-cQTY'));
    	var gPRICE = Number(cartChkbox[i].getAttribute('data-gPRICE')); 
    	var gDISCOUNT = Number(cartChkbox[i].getAttribute('data-gDISCOUNT')); 
    	
		total = total + (gPRICE * cQTY );  //할인 전 상품 전체 금액
		discount = discount + gPRICE * cQTY * gDISCOUNT * 0.01; //할인된 금액
	}
    total = Math.round(total * 10) / 10;
    if((total-discount)<30000) {
    	delivery = 3000;
    }
    finalTotal = total - discount + delivery;
    document.getElementsByClassName('cart-total')[0].innerText = numberWithCommas(total);
    document.getElementsByClassName('cart-discount')[0].innerText = numberWithCommas(discount);
    document.getElementsByClassName('cart-delivery')[0].innerText = numberWithCommas(delivery);
    document.getElementsByClassName('cart-finalTotal')[0].innerText = numberWithCommas(finalTotal);
    
    localStorage.setItem('finalTotal',finalTotal);
}

