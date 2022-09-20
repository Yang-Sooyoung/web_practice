// (문제) 아래의 코드를 "프로토타입 체인"을 이용하여 상속이 구현되도록 바꿔보시오.
// 이때, 상속을 계속해서 여러 단계까지 구현해보시오.


// [1]
// const apt = {
	// color: "red",
	// rooms: 4,
	// toilet: 1,
	// turnon() {
		// console.log( "turn on.." );
	// }
// };

// const villa = {
	// color: "black",
	// rooms: 3,
	// toilet: 1,
	// turnon() {
		// console.log( "turn on.." );
	// }
// };

// const oneroom = {
	// color: "blue",
	// rooms: 1,
	// toilet: 1,
	// turnon() {
		// console.log( "turn on.." );
	// }
// };


// [2]
const housing = {
	toilet: 1,
	turnon() {
		console.log( "turn on.." );
	}
};

const apt = {
	color: "red",
	rooms: 4,
};
console.log( apt );  			// __proto__ ==> Object(최상위)
// apt.turnon();				// 불가능

apt.__proto__ = housing;		// 상속 구현
console.log( apt );			// __proto__ ==> housing
apt.turnon();				// 가능

const villa = {
	color: "black",
	rooms: 3,
};
villa.__proto__ = housing;

const oneroom = {
	color: "blue",
	rooms: 1,
};
oneroom.__proto__ = housing;





// [3] : 여러 단계까지 상속을 구현
const rainbow = {
	name: "무지개 아파트",
	rooms: 5
};
rainbow.__proto__ = apt;


// rainbow --> apt, housing 멤버를 모두 사용하는 것이 가능 --> 상속 구현.
console.log( '-----------------------------------------------' );
console.log( rainbow.name );		// 무지개 아파트
console.log( rainbow.rooms );		// 5
console.log( rainbow.color );			// red
console.log( rainbow.toilet );			// 1
rainbow.turnon();					// turn on..




































