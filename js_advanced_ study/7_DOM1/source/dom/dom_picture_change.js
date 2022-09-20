window.onload = () => {
	
	// 작은 이미지들 가져오기
	const imgs = document.querySelectorAll( '.small_img' );
	// console.log( imgs );

	// [1] : 일반적인 for 반복문 사용 --> 순회하면서 --> 클릭시 속성 변경.
	// for( let i=0; i < imgs.length; i++ ) {
		// imgs[i].onclick = function() {
			// console.log( this.dataset.image );
			// document.getElementById( 'big_img' ).src = this.dataset.image;
		// };
	// }
	
	// [2] : NodeList 객체의 --> forEach() 메서드를 사용하여 처리.
	imgs.forEach( elem => {
		// console.log( elem );
		elem.addEventListener( 'click', function() {
			// 처리할 코드
			// console.log( elem );
			console.log( this.dataset.image );
			document.getElementById( 'big_img' ).src = this.dataset.image;
		} );
	} );
	
};










