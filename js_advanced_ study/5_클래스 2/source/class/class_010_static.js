// 자바스크립트 클래스 - 정적 메서드
// 중요 포인트
// 1. 어떻게 정적 메서드를 구현하는지에 대해서 알아야하겠다.
// 2. 정적 메서드가 어떤 경우에 호출될 수 있고, 또 어떤 경우에는 호출이 안되는지를 알아야하겠다.
// 3. 인스턴스(객체)가 정적 메서드를 호출할 수 있는지 없는지에 대해서도 알아야하겠다.


// [1] : 정적 메서드 --> Static(고정된) Method
// 메서드 앞에 static 키워드를 붙여주면 --> 따로 인스턴스(객체)를 생성하지 않아도 --> 메서드 호출이 가능 O.
// 반대로 --> 인스턴스(객체)를 통해서 호출하는 것은 가능 X.
// 다르게 표현하면 --> 인스턴스에 따라 달라지지 않는 고정된 메서드.
class Animal {
	constructor( name ) {
		this.name = name;
	}
	getName() {
		return this.name;
	}
	sleep() {
		console.log( '잠자다.' );
	}
	static sleep2() {
		console.log( 'Zzz...' );
	}
}

const ani1 = new Animal( '호랑이' );

ani1.sleep();
console.log( ani1.getName() );
Animal.sleep2();			// Zzz...

// ani1.sleep2();  			// Err --> 인스턴스(객체)를 통해서는 호출이 X. --> 인스턴스를 통해서 호출이 가능하게 할려면? --> constructor 사용.
ani1.constructor.sleep2();	// Zzz...





// [2] : 상속 관계에서의 정적 메서드
console.clear();
class Add {
	static plus( x ) {
		x = x || 100;
		return x + 1000;
	}
}

class ChildAdd extends Add {
	static plus( x ) {
		return super.plus(x) + super.plus(x) + super.plus(x);
	}
}

const add1 = new Add();
// console.log( add1.plus() );					// Err
console.log( add1.constructor.plus(30) );		// 1030

const cadd1 = new ChildAdd();
// console.log( cadd1.plus() );				// Err
console.log( cadd1.constructor.plus(30) );	// 3090


// console.log( Add.plus() );			// 1100
// console.log( Add.plus(500) );		// 1500
// console.log( ChildAdd.plus() );		// 3300
// console.log( ChildAdd.plus(300) );	// 3900
// console.log( ChildAdd.plus(30) );	// 3090




























