// 앞서의 예제를 생성자 함수와 new 연산자를 사용하는 예제로 바꿔보시오.


// [1] : 생성자 함수
const Housing = function( name, color, rooms ) {
	this.name = name;
	this.color = color;
	this.rooms = rooms;
};


// [2] : (Housing) 프로토타입 객체
Housing.prototype.toilet = 1;
Housing.prototype.turnon = function() {
	console.log( "turn on.." );
};


// [3] : 객체 생성 --> new
const apt = new Housing( 'apt', 'red', 4 );
console.log( apt.name );
console.log( apt.color );
console.log( apt.rooms );
console.log( apt.toilet );
apt.turnon();

console.log( '-----------------------------------' );

const oneroom = new Housing( 'oneroom', 'white', 1 );
console.log( oneroom.name );
console.log( oneroom.color );
console.log( oneroom.rooms );
console.log( oneroom.toilet );
oneroom.turnon();

console.log( '-----------------------------------' );

const rainbow = new Housing( '무지개 아파트', 'blue', 5 );
console.log( rainbow.name );
console.log( rainbow.color );
console.log( rainbow.rooms );
console.log( rainbow.toilet );
rainbow.turnon();

// 수정
// rainbow.prototype.name = "태양 아파트";  // Err
console.clear();
console.log( rainbow );
rainbow.name = "태양 아파트";
console.log( rainbow.name );
console.log( rainbow );


// 수정이 저렇게 되어진다면 외부에서 손쉽게 수정을 할 수 있다는 것인데 --> 그럼 수정이 안되게끔 하려면 어떻게 해야 하는가?























