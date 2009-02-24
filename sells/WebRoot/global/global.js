function checkYMD(obj,filedName){
  var data1 = obj.value.match(/(\d{4})\/(\d{2}|\d{1})\/(\d{2}|\d{1})/);
  var data2 = obj.value.match(/(\d{4})(\d{2})(\d{2})/);
  if ( obj.value != "" ) {
    if ( !data2 && !data1) {
      alert(filedName+" 日期格式錯誤");
      obj.focus();
      return fasle ;
    }
    var mm = eval(RegExp.$2);
    var dd = eval(RegExp.$3);
    if ((mm<1) || (mm > 12))  {
      alert(filedName + " 月份異常");
      obj.focus();
      return fasle ;
    }
    if ((dd<1) || (dd > 31))  {
      alert(filedName + " 日份異常");
      obj.focus();
      return fasle ;
    }
    obj.value = RegExp.$1.concat("/",("0"+RegExp.$2).substr(("0"+RegExp.$2).length-2),"/",("0"+RegExp.$3).substr(("0"+RegExp.$3).length-2));
  }
}

function LTrim(str){ 
var i;
for(i=0;i <str.length ; i++){
  if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
}
str = str.substring(i,str.length);
return str;
}
function RTrim(str){
var i;
for(i=str.length-1;i>=0;i--){
if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
}
str = str.substring(0,i+1);
return str;
}
function Trim(str){
return LTrim(RTrim(str));
}

function checkObj(obj,msg) {
  obj.value = Trim(obj.value);
  if (obj.value ==''){
    alert("請輸入 "+msg);
	obj.focus();
    return true ;
  } else {
    return false ;
  }
}
function chk_mail(mail){
  var vRegExp=new RegExp("^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,3}$","gi");
  var vValue=mail;
  return vRegExp.test(vValue)
}
function checkNum(obj,msg) {
	re = /\D/;
	if (re.test(obj.value)) {
	  alert(msg + " , 請輸入數字");
	  obj.focus();
	  return true ;
  	} else {
      return false ;
  	}
} 