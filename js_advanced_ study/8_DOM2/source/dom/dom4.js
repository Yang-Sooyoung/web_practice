// DOM - 사용자 입력 폼과 노드 추가


// [1] : 버튼 클릭시 사용자 이름과 홈페이지 주소가 바디에 추가.
window.onload = () => {
	document.getElementById( 'btn' ).addEventListener( 'click', function() {

		// 사용자 입력 값
		const user_name2 = document.getElementById( 'user_name' );
		const user_home2 = document.getElementById( 'user_home' );
		console.log( user_name2.value, user_home2.value );
		
		// a 태그 노드 생성
		let aTagNode = document.createElement( 'a' );
		aTagNode.href = user_home2.value;
		
		// 텍스트 노드 생성
		let txtNode = document.createTextNode( user_name2.value );
		aTagNode.appendChild( txtNode );
		
		// 리스트에 붙이기
		let memList = document.getElementById( 'memberList' );
		let br = document.createElement( 'br' );
		
		memList.appendChild( aTagNode );
		memList.appendChild( br );  // <br>
		user_name2.value = "";
		user_home2.value = "";
		
	} )
};




















