// 자바스크립트의 이벤트 동작 방식과 이벤트 대상 얻기


window.onload = () => {
	
	// [1]
	// 버튼이 사용자의 행위에 의해 클릭되었는지 확인하기 --> 이벤트 발생의 신뢰 --> isTrusted
	const btn = document.querySelector( 'button' );
	btn.addEventListener( 'click', addMouseEvent );
	
	function addMouseEvent( e ) {
		console.log( e );
		// isTrusted 속성 	--> 	이벤트가 사용자 행위에 의하여 발생되었으면 true로 신뢰할 수 있고,
		//							아니면 스크립트나 이벤트를 자동으로 실행시키는 메서드 등에 의해서 실행되었다면 false.
		
		const bool = e.isTrusted;
		if( bool ) {
			console.log( bool + " --> 이 이벤트는 신뢰할 수 있습니다." );
		}
		else {
			console.log( bool + " --> 이 이벤트는 신뢰할 수 없는 이벤트입니다." );
		}
	};
	
	// isTrusted 속성의 값이 false가 되는 경우 --> 스크립트에 의한 또는 dispatchEvent() 메서드에 의해서 자동 실행되면 --> false.
	const event = new Event( 'click' );
	elem.dispatchEvent( event );
	
	// dispatchEvent 메서드 		-->		이벤트를 "실행시키다, 처리하다, 보내다, 발송하다" 라는 뜻.
	//									html 페이지를 실행시키자마자 자동으로 이벤트가 실행되므로 --> isTrusted 속성의 값이 --> false.
	
	
	
	// [2]
	// addEventListener 3번째 파라미터 설정 있고 없고 --> 없으면 버블링(기본, false, 해당 요소에서 상위로 전파) --> 있으면 캡처링(true).
	const spans = document.querySelectorAll( "span" );
	// console.log( spans.length );  // 3
	
	// forEach()
	spans.forEach( span => {
		span.addEventListener( 
			'click', 
			function( e ) {
				console.log( e.currentTarget.id );				// 이벤트 대상 얻기 --> id
				console.log( e.currentTarget.className );		// 이벤트 대상 얻기 --> class
			}, 
			// {
				// capture: false  // 보통은 버블링으로 동작. 그래서 디폴트가 버블링.
			// } 
			true
		);
	} );
	
};




















