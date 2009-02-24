function checkForm(formObj){
  if ( formObj.loginId.value == '') {
     alert("請輸入帳號!");
	 formObj.loginId.focus();
	 return false ;
  }
  if ( formObj.passwd.value == '') {
     alert("請輸入密碼!");
	 formObj.passwd.focus();
	 return false ;
  }
}
