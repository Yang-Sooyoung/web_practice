// DOM - 노드 삭제


// [1] : 첫 번째 방식
// window.onload = () => {
	// document.getElementById( 'btn' ).addEventListener( 'click', function() {
		// let memList = document.getElementById( 'memberList' );				// Parent Element
		// let p1 = document.getElementById( 'p1' );								// Child Element --> 삭제할 요소.
		// memList.removeChild( p1 );											// 부모 요소에서 자식 요소 삭제.
	// } )
// };


// [2] : 두 번째 방식
window.onload = () => {
	document.getElementById( 'btn' ).addEventListener( 'click', function() {
		let p1 = document.getElementById( 'p1' );								// Chile Element --> 삭제할 요소.
		p1.parentNode.removeChild( p1 );										// p1의 부모 노드를 알아서 찾은 다음에 자식 요소 삭제.
	} )
};











































