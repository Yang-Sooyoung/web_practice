// onclick vs addEventListener 두 메서드의 차이
// onclick --> 하나의 콜백 함수(리스너)만 지정해서 등록. --> DOM 초기부터의 메서드. --> 호환성.
// addEventListener --> 거의 대부분의 모던 브라우저가 지원 --> 여러 개의 이벤트 리스너를 등록하여 처리. --> 모던 자바스크립트로 넘어가면서 새롭게 추가된 메서드. (권장)


// [1] : onclick 사용시 --> 클릭시 구현될 기능(function)만 충실히 수행.
// 다른 이벤트 핸들러가 있을 시 --> 기존 이벤트 핸들러를 덮어씀.
// window.onload = () => {
	// const elem = document.getElementById( 'btn' );
	// elem.onclick = function() {
		// alert( '클릭했군요~ 1번' );
	// };
	// elem.onclick = function() {
		// alert( '클릭했군요~ 2번' );
	// };
// };


// [2] : addEventListener 사용시 --> 여러 이벤트 등록이 가능하여 --> 각각 함수가 수행. 덮어쓰지 X.
// 거의 모든 브라우저가 지원. --> 이 메서드를 사용하여 객체나 요소에 이벤트 리스너를 전달.
// 3번째 파라미터 값으로 		--> 버블링, 캡처링 등의 사용여부를 설정할 수 있다. --> 기본은 false
// false 설정시 				--> 버블링으로 동작 --> 이벤트가 발생한 요소에서 window 까지 이벤트를 전파(Propagation).
//							--> 자식객체 => 부모객체로. 즉, 상위로 전파.
// true 설정시				--> 캡처링으로 동작 --> 부모객체 => 자식객체순.
// event.stopPropagation	--> 다음 캡처링이나 버블링을 멈춤.
window.onload = () => {
	const elem = document.getElementById( 'btn' );
	elem.addEventListener( 'click', function() { 
		event.stopPropagation();
		alert( '클릭했군요~ 1번' ); 
	}, false );

	const elem2 = document.getElementById( 'btn2' );
	elem2.addEventListener( 'click', function() { 
		alert( '클릭했군요~ 2번' ); 
	}, false );
};


// [3] : 사용은?
// 구버전의 브라우저(IE와 같은) 지원 등의 호환성을 고려해야하는 상황이라면 --> onclick 메서드 사용.
// 굳이 그럴 필요가 없다면 --> 모던한 addEventListener 사용을.















