// DOM - innerHTML vs innerText


// [1] : innerHTML을 이용하여 바디에 이미지 추가하기
window.onload = () => {
	
	// 문자열 변수 하나 생성
	let strHtml = "";
	strHtml += "<h1>제목 : 흔한 동해안의 파도 클래스</h1>";
	strHtml += "<img src='https://cdn.pixabay.com/photo/2020/11/07/13/07/waves-5720916_960_720.jpg' ";
	strHtml += "width='400' height='300'>";
	
	// 바디에 붙이기
	// document.body.innerText = strHtml;  	// 텍스트 자체로 삽입 --> HTML 태그 사용이 X.
	document.body.innerHTML = strHtml;	
	
};
