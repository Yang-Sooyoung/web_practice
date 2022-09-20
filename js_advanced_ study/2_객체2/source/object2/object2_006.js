// 객체의 프로토타입 출력


// [1] : __proto__ vs Object.getPrototypeOf()
function A() {}

let obj = new A();

console.log( obj.__proto__ );  						// A()
console.log( Object.getPrototypeOf( obj ) );		// A()


// [2] : ===
function B() {}
let obj2 = new B();

console.log( obj2.__proto__ === Object.getPrototypeOf( obj2 ) );  // true



