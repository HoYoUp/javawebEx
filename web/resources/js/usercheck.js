function hidepwd(s){
	// var r = [];
	// for(var i=0;i<s.length;i++){
		// var m = s.charAt(i);
		// r[i]=m;
		// if(m>='0'&&m<='9')
			// r[i]=r[i]-'0'+'a';
		// else if(m>='a'&&m<='9')
	// }
	// return r.toString();
	return s+"cc";
}
function check() {
    var name = document.getElementById("name").value;
    var pwd = document.getElementById("pwd").value;
    var code = document.getElementById("cc").value;
    if(name==""||name==null){
        alert("用户名不能为空");
        return false;
    }
    else if(pwd==""||pwd==null){
        alert("密码不能为空");
        return false;
    }
    else if(code==""||code==null){
        alert("验证码不能为空");
        return false;
    }
    else{
		document.getElementById("pwd").value=hidepwd(pwd);
        return true;
    }

}
function isPhone(phone) {
    if(phone.match("^[1][3,4,5,8,7][0-9]{9}$")){
        return true;
    } else{
        alert("输入非手机，请重新输入")
        return false;
    }
}
//校验密码强度---沒有匹配到以下級別就提示
function checkpwd(value){
    // 0： 表示第一个级别 1：表示第二个级别 2：表示第三个级别
    // 3： 表示第四个级别 4：表示第五个级别
    var arr=0;
    if(value.length < 6){//最初级别
        return 0;
    }
    if(/\d/.test(value)){//如果用户输入的密码 包含了数字
        arr++;
    }
    if(/[a-z]/.test(value)){//如果用户输入的密码 包含了小写的a到z
        arr++;
    }
    if(/[A-Z]/.test(value)){//如果用户输入的密码 包含了大写的A到Z
        arr++;
    }
    if(/\W/.test(value)){//如果是非数字 字母 下划线
        arr++;
    }
    return (arr>=4)?true:false;
}
function okpwd(pwd) {
    var pwdRegex = new RegExp('(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[\W]).{8,16}');
    if(pwd.match(pwdRegex)){
        return true;
    }
    else{
        alert("密码长应大于6且包含大小写字母、数字及字符");
        return false;
    }
}
function checkRegister(){
    var pwd1 = document.getElementById("pwd1").value;
    var pwd = document.getElementById("pwd").value;
    if(check()){
            if(pwd!==pwd1){
                alert("两次密码输入不一致");
                return false;
            }
            else{
                if(okpwd(pwd)) {
                    var phone = document.getElementById("phone").value;
                    if(phone!==null||phone!==""){
                        return isPhone(phone);
                    }
                    else {
                        alert("手机号不能为空");
                        return false;
                    }
                }
        }
    }

}