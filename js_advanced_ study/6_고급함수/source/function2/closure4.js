// li 리스트 태그에서의 클로저와 let


// [1]
// const li = document.querySelectorAll( "li" );

// for( let i=0; i < li.length; i++ ) {
	// console.log( i );
	// li[i].addEventListener( "click", () => console.log( i + "번째 요소입니다." ) );
// }

// li 태그를 클릭하면 모두 같은 값이 콘솔에 출력.
// i 값이 이벤트 콜백함수내에서 외부의 var로 선언되어져 있는 i를 참조하는게 문제.
// 문제해결은? --> ??? --> 재할당이 가능하면서, 블록 스코프 변수인 let 사용 --> var => let 으로 변경.


// [2]
console.clear();
const makeList = ( ar ) => {
	let el = '<ul>\n';
	for( let i=0; i < ar.length; i++ ) {
		el += '<li>' + ar[i] + '</li>\n';
	}
	el += '</ul>';
	return el;
}

const animals = [ '사자', '호랑이', '하마', '악어', '개', '고양이', '코끼리' ];
const li_items = makeList( animals );
console.log( li_items );
document.body.innerHTML = li_items;

// Click Event
const li = document.querySelectorAll( "li" );

for( let i=0; i < li.length; i++ ) {
	li[i].addEventListener( "click", () => console.log( i + '번째 요소' ) );
}

























