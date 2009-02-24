function addCart(itemNo,itemNm,spec1,spec2,price,sells,target) {
  var winName = "_parent" ;
  var features = "top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes" ;
  var url = "http://www.icart.tw/Sells/shopcar.do?" ;
  url = url + "itemNo=" + encodeURIComponent(itemNo);
  url = url + "&itemNm=" + encodeURIComponent(itemNm);
  url = url + "&spec1=" + encodeURIComponent(spec1);
  url = url + "&spec2=" + encodeURIComponent(spec2);
  url = url + "&price=" + price;
  url = url + "&qty=1" ;
  url = url + "&sells="+sells ;
  if (target == "_blank" ) {
    winName = target ;
    features = features + ",width=800,height=600" ;
  }
  window.open(url,winName,features);
}

function addCartForm(formObj) {
  var spec1 = "" ;
  var spec2 = "" ;
  if ( typeof(formObj.spec1 ) == 'object') {
    spec1 = formObj.spec1.options[formObj.spec1.selectedIndex].value ;
  }
  if ( typeof(formObj.spec2 ) == 'object') {
    spec2 = formObj.spec2.options[formObj.spec2.selectedIndex].value ;
  }
  addCart(formObj.itemNo.value,formObj.itemNm.value,spec1,spec2,formObj.price.value,formObj.sells.value,formObj.target.value);
}