// 객체 생성시 생성자 안에서 메서드를 정의하면 안되는 이유


// [1] : 실습
function Add( a, b ) {
	this.a = a;
	this.b = b;
	this.plus = function() {
		return this.a + this.b;
	};
}

let add1 = new Add( 100, 20 );
console.log( add1.plus() );  // 120
console.log( add1 );

let add2 = new Add( 200, 30 );
console.log( add2 );

let add3 = new Add( 300, 40 );
console.log( add3 );

let add4 = new Add( 400, 50 );
console.log( add4 );


// [2] : 실습 --> Add 프로토타입 객체
console.log( '-------------------------------------------' );
function Add2( a, b ) {
	this.a = a;
	this.b = b;
}

Add2.prototype.plus = function() {
	return this.a + this.b;
};

Add2.prototype.name = "대한민국";

let newadd1 = new Add2( 100, 20 );
console.log( newadd1 );

let newadd2 = new Add2( 200, 30 );
console.log( newadd2 );

let newadd3 = new Add2( 300, 40 );
console.log( newadd3 );

let newadd4 = new Add2( 400, 50 );
console.log( newadd4 );


console.log( newadd4.plus() );  // 450
console.log( newadd4.name );  // 대한민국
console.log( newadd1.name );  // 대한민국
console.log( newadd1.plus() );  // 120














