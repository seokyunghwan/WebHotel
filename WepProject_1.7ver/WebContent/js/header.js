// JavaScript로 이벤트 처리하기
'ues strict';
const toggleBtn = document.querySelector('.navbar__toggleBtn');
const menu = document.querySelector('.navbar_menu');
// .navbar__toggleBtn을 클릭하면 .navbar_menu들이 생겨나고 또 클릭하면 없어지는 이벤트

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');

});

let totalByte = 0;

function chkword(obj) {

let strValue = obj.value;
let len = 0; //길이
let oneChar = "";

for (let i = 0; i < strValue.length; i++) {
    oncChar = strValue.charAt(i);
    if (escape(oneChar).length > 4){
        totalByte += 2;
    } else {
        totalByte++;
    } //if-end
} // for-end
console.log(totalByte);
return totalByte
}

function check(){
	if(totalByte < 2){
		alert("최소 2글자 이상 입력해 주세요.")
		return false;
	} else {
		return true;
	}
		
}