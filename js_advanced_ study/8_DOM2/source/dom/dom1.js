// DOM - 개요와 텍스트 노드


// [1] : DOM이란 무엇인가?
// Document Object Model의 약자 --> 웹의 문서와 웹의 태그와 관련된 객체를 의미.
// HTML 요소들의 구조화된 표현.
// DOM 객체 구조는 "노드 트리" 라고 표현 : 부모 가지 --> 자식 가지(element) --> 잎.
// 이러한 DOM 요소를 기반으로 브라우저가 해석하여 랜더링.


// [2] : 태그, 노드, 객체 --> 거의 같은 개념.
// 자바스크립트를 이용하면 직접 이러한 노드를 추가하고, 삭제하고 하는 등의 DOM 조작 작업을 할 수 있다. --> DOM을 배우는 궁극적인 이유!
// 즉, 손으로 직접 태그(노드)를 입력하지 않아도 태그를 body 태그안에 추가시킬 수 있다.
//
//													<html> (Root Element)


//						<head>																	<body>
//					     (element)															     (element)


//			<meta>					<title>										<h1>				<p>				<ul>
//		    (element)                              (element)                                                                 (element)                     (element)             (element)
//																			        text                               text

//	   																								<a>				 <li>
//																								  (element)            (element)


// [3] : 텍스트 노드
// 1. 제일 먼저 생성하고자 하는 엘리먼트 요소를 생성. --> createElement() (즉, 태그를 생성)
// 2. 원하는 텍스트를 변수에 저장. --> createTextNode()
// 3. 해당 객체에 붙여준다. --> appendChild()
window.onload = () => {
	
	// p 엘리먼트 생성
	const eleNode = document.createElement( "p" );
	
	// 텍스트 노드 생성
	const txtNode = document.createTextNode( "Welcome to DOM" );
	
	// 붙이기
	eleNode.appendChild( txtNode );  // <p>Welcome to DOM</p>
	// console.log( eleNode );
	
	// 붙이기
	document.body.appendChild( eleNode );
	
};


























































