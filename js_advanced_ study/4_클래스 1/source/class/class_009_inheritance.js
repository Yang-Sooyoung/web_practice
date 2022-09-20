// 자바스크립트 클래스 - 상속(Inheritance)
// 부모가 가진 자원을 그대로 상속받아 자식 클래스를 생성 및 확장해서 만들 수 있다.
// 기존 부모가 가진 자원을 물려받아 자식이 더 크게 확장하여 만들 수 있기 때문에 --> extends 키워드 사용.
// 부모로부터 물려받은걸 그대로 사용해도 되고, 자식이 재정의해서 사용하는 것도 가능.


// [1] : 실습
// 부모 클래스
class Animal {
	constructor( name, age ) {
		this.name = name;
		this.age = age;
	}
	eat() {
		return this.name + ' 먹다.';
	}
}

// 자식 클래스
class Tiger extends Animal {
	// 자식 클래스에서 eat() 메서드를 재정의.
	eat() {
		return this.name + ' 빨리 먹다.';
	}
}

const t1 = new Tiger( '호랑이', 2 );
console.log( t1.name );
console.log( t1.age );
console.log( t1.eat() );  // 호랑이 빨리 먹다.











