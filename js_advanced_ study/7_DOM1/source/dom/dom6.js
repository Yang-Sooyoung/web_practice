// DOM - li 엘리먼트의 특정 문자열로 li 요소 삭제하기


// [1] : li의 문자열로 해당 요소 삭제 --> 함수 만들기
function removeElemByText( text ) {
	const li = document.querySelectorAll( 'li' );
	console.log( li );		// NodeList 객체를 반환.
						// 1. 자바스크립트에서 Element 배열을 다룰시 --> querySelectorAll은 NodeList 객체를 반환. (배열과 차이점 O)
						// 2. NodeList 객체의 프로토타입 메서드 --> forEach 메서드를 이용하여 순회하면서 각 엘리먼트를 비교하여 조건 처리.
						// 3. 모던 브라우저의 경우는 대부분 지원 --> 구브라우저(IE)는 지원하지 X.
						// 4. 아.. 그럼 이 메서드는 브라우저의 API구나.. 그런데 JS에서도 호출해서 사용할 수 있다.
						// 5. NodeList와 Array의 가장 큰 차이점 --> NodeList는 자바스크립트 API가 아니고, 브라우저가 제공하는 API.
	
	const li2 = [...document.querySelectorAll( 'li' )];
	console.log( li2 );	// Array 객체를 반환.
	
	// for( let value of li ) {
		// console.log( value );
	// }
	
	// 자식 요소 삭제
	li.forEach( elem => {
		// 조건 처리
		if( elem.innerText == text )
			elem.parentNode.removeChild( elem );
	} );
	
	// NodeList vs Array
	// 유사점
	// 1. 배열의 길이에 대한 정보를 가진다. --> length 속성. 이 부분은 두 객체 모두 공통점.
	console.clear();
	console.log( '----------------------------------------- 1' );
	console.log( li.length );					// 4
	console.log( li2.length );					// 4
	
	// 2. item() 메서드(NodeList)
	console.log( '----------------------------------------- 2' );
	console.log( li.item(0) );					// 첫 번째 li 요소
	console.log( li.item(0).innerText );		// 홍길동
	// console.log( li2.item[0] );				// Err
	console.log( li2[2] );						// 세 번째 li 요소
	console.log( li2[2].innerText );			// 강감찬
	
	// 3. 참조를 벗어날 때
	console.log( '----------------------------------------- 2' );
	console.log( li.item(4) );					// null
	console.log( li2[4] );						// undefined
	
};


// [2] : 함수 호출
document.getElementById( 'btn' ).addEventListener( 'click', function() {
	removeElemByText( '을지문덕' );
} );




















