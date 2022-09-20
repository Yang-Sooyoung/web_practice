// new 연산자의 내부 동작


// [1] : 내부적으로는 빈 객체를 생성한 후에 --> 같은 이름의 "프로토타입 객체"를 새로운 객체의 원형(프로토타입)으로 설정.
function Add( a, b ) {
	this.a = a;
	this.b = b;
}

Add.prototype.plus = function() {
	return this.a + this.b;
};
 

// [2] : 새로운 객체 생성
const add = new Add( 111, 222 );
console.log( add.plus() );  // 333


// [3] : 내부 동작
// const newobj = {};
// newobj.__proto__ = Add.prototype;
// Add.apply( newobj, [111, 222] );  // 인자 값들을 하나로 묶어서 적용해줘야 함.
// console.log( newobj.plus() );  // 333


// 정리
// 생성자 함수와 new 연산자에 의해 새로운 객체 생성 --> 어떤 편리한 장점 --> 객체의 생성과 새로운 객체의 원형(프로토타입)을 지정.
// 뿐만 아니라, 괄호안에 ( 111, 222 )와 같은 초기화 값을 생성시에 편리하게 지정 --> 새로운 객체 인스턴스를 생성.










