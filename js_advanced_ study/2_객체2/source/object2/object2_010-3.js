// 생성자 함수내의 속성 값을 외부에서 수정하지 못하도록 변경하시오.
// 방법
// 1. 생성자 함수내에서 const로 name 변수를 만든다.
// 2. 해당 값을 외부에서 불러올 수 있도록 전용 getName() 메서드를 만든다.
// 3. 기존 코드에서 name 불러오는 부분을 모두 getName() 메서드로 바꿔 호출한다.


// [1] : 생성자 함수
const Housing = function( name, color, rooms ) {
	// this.name = name;
	// this.color = color;
	// this.rooms = rooms;
	const n = name;
	this.getName = () => console.log( n );

	const c = color;
	this.getColor = () => console.log( c );

	const r = rooms;
	this.getRooms = () => console.log( r );
};


// [2] (Housing) 프로토타입 객체
Housing.prototype.toilet = 1;
Housing.prototype.turnon = function() {
	console.log( "turn on.." );
};


// [3] : 객체 생성 --> new
const apt = new Housing( 'apt', 'red', 4 );
// console.log( apt.name );
// console.log( apt.color );
// console.log( apt.rooms );
apt.getName();
apt.getColor();
apt.getRooms();
console.log( apt.toilet );
apt.turnon();

console.log( '-----------------------------------' );

const oneroom = new Housing( 'oneroom', 'white', 1 );
// console.log( oneroom.name );
// console.log( oneroom.color );
// console.log( oneroom.rooms );
oneroom.getName();
oneroom.getColor();
oneroom.getRooms();
console.log( oneroom.toilet );
oneroom.turnon();

console.log( '-----------------------------------' );

const rainbow = new Housing( '무지개 아파트', 'blue', 5 );
// console.log( rainbow.name );
// console.log( rainbow.color );
// console.log( rainbow.rooms );
rainbow.getName();
rainbow.getColor();
rainbow.getRooms();
console.log( rainbow.toilet );
rainbow.turnon();


// console.log( rainbow.name );  // undefined

// console.clear();
// console.log( rainbow );

// 수정
// rainbow.color = "yellow";
// rainbow.rooms = 50;
// console.log( rainbow );













































