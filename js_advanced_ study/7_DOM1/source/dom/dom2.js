// DOM - 이미지 노드


// [1] : 이미지 노드
// 1. 제일 먼저 생성하고자 하는 엘리먼트 요소를 생성. (즉, 태그를 생성) --> img
// 2. 생성한 이미지 엘리먼트에 속성을 추가. --> 2가지 방식 --> . 	vs 		setAttribute()
// 3. 해당 객체에 붙여준다. --> appendChild()
window.onload = () => {
	
	// img 엘리먼트 생성
	const imgNode = document.createElement( "img" );
	
	// 생성한 이미지 엘리먼트(태그)에 속성 추가
	imgNode.src = "https://cdn.pixabay.com/photo/2020/11/07/13/07/waves-5720916_960_720.jpg";
	imgNode.width = 400;
	imgNode.height = 300;
	
	// 바디에 붙이기
	// console.log( imgNode );  // <img src="경로" width=400 height=300>
	document.body.appendChild( imgNode );	
	
};


// [2] : 이미지 노드 --> 메서드를 이용하여 속성을 추가 --> setAttribute()
// setAttribute() 메서드를 이용하여 속성을 추가하면 어떤 장점? --> 사용자 정의 속성을 직접 만들어서 추가하는 것이 가능.
// window.onload = () => {
	
	// 이미지 엘리먼트 생성
	// const imgNode = document.createElement( "img" );
	
	// 생성한 이미지 엘리먼트에 속성을 추가
	// imgNode.setAttribute( "src", "https://cdn.pixabay.com/photo/2020/11/07/13/07/waves-5720916_960_720.jpg" );
	// imgNode.setAttribute( "width", 400 );
	// imgNode.setAttribute( "height", 400 );
	// imgNode.setAttribute( "addProperty", "obj1" );
	
	// 바디에 붙이기
	// document.body.appendChild( imgNode );
	
// };


























































