// 자바스크립트 클래스 - 상속과 super(2)


// [1]
class Animal {
	constructor( group ) { this.group = group;	}
	getGroup() { return this.group; }
	eat() {}
	sleep() {}
	bark() { return `짖다.`; }
}

class Mammal extends Animal {
	constructor( name, finger, toe, eyesight ) {
		super( Mammal.name );  // 부모의 생성자를 호출 --> this 보다 super가 당연히 먼저 호출되어야 함. --> 안그러면 참조 오류!
		this.name = name;
		this.finger = finger;
		this.toe = toe;
		this.eyesight = eyesight;
	}
	run() {
		return `${ this.name }(${ this.group }) 뛴다.`;
	}
	bark() {
		return `크게 짖다.`;
	}
	move() {
		console.log( `${ this.name } 이동하면서 ${ super.bark() }` );
	}
}

const mam1 = new Mammal( '호랑이', 10, 10, 1.5 );
console.log( mam1.getGroup() );  // Mammal
console.log( mam1.name );  // 호랑이
console.log( mam1.finger );
console.log( mam1.toe );
console.log( mam1.eyesight );
console.log( mam1.run() );
console.clear();
console.log( mam1.bark() );  	// override --> (1) 기각하다; 무시하다 (2) ~보다 더 우선하다; 우선시하다.
mam1.move();					// 호랑이 이동하면서 크게 짖다.


// 속성 출력
console.log( Object.getOwnPropertyNames(mam1) );  // ["group", "name", "finger", "toe", "eyesight"]
console.log( Object.getOwnPropertyNames(Object.getPrototypeOf(mam1)) );  // ["constructor", "run", "bark", "move"]






