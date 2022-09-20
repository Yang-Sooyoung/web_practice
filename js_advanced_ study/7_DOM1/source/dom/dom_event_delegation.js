// 이벤트 위임과 활용(Event Delegation) - event.target vs event.currentTarget


window.onload = () => {
	
	// [1]
	// const lis = document.querySelectorAll( 'li' );
	// lis.forEach( ele => {
		// ele.addEventListener( 'click', function( event ) {
			// console.log( '이미지가 클릭되었습니다.' );
			// console.log( '---------------------------------------' );
			
			// console.log( event.target );
			// 이벤트가 일어날 (자식)객체를 의미.
			// 즉, 이벤트 버블링의 가장 끝단에 위치한 마지막 요소를 반환. --> 클릭한 요소 --> 자식 객체.
			// 좀 더 쉽게 설명하면 --> 이미지 자체를 클릭한 거이므로 --> <img.. 이런식의 이미지 태그가 타겟이고, 이걸 반환.
			
			// console.log( event.currentTarget );
			// event.currentTarget --> 이벤트가 위임된 부모의 객체를 반환.
			// 즉, event.target이 이미지 태그(img)를 기준으로 가져온다면 event.currentTarget은 이미지 태그의 부모격인 li 요소를 반환.
			// 부모 객체를 반환 --> event.currentTarget --> li
			
		// } );
	// } );
	
	// [2]
	// Event Delegation(이벤트 위임)
	function getEventTarget( e ) {
		e = e || window.event;
		return e.target;
	};
	
	// 새로운 동물을 동적으로 추가하게 된다면?
	const memberList = document.querySelector( '.memberList' );
	memberList.addEventListener( 'click', function( event ) {
		console.log( '이미지가 클릭되었습니다.' + event.target );
		const t = getEventTarget( event );
		console.log( t.id );
		console.log( t.src );
		// console.log( event.target.id );  	// id 값 출력
		// console.log( event.target.src );	// 이미지 주소(경로) 값 출력
	} );
	
	const liNode = document.createElement( 'li' );
	const txtNode = document.createTextNode( '추가 동물 호랑이' );
	
	// img 엘리먼트 생성
	const imgNode = document.createElement( 'img' );
	
	// 생성한 이미지노드 엘리먼트(태그)에 속성 추가.
	 imgNode.src = "https://cdn.pixabay.com/photo/2017/11/06/09/53/tiger-2923186__340.jpg";
	 imgNode.width = 100;
	 imgNode.height = 100;
	 imgNode.id = "호랑이";
	 imgNode.class = "ddd";
	 
	 // 붙이기
	 liNode.appendChild( imgNode );
	 liNode.appendChild( txtNode );
	 memberList.appendChild( liNode );
		
};





















