// 자바스크립트 클래스 - getter, setter


// [1] : getter
// getter --> 클래스 속성에 접근하여 값을 가져오고자 할 때 사용.
// getter는 메서드명 앞에 get 키워드를 붙여서 사용.
// [주의!] 메서드 사용시 마치 속성처럼 사용. --> 즉, getter는 호출 X. --> 끝에 괄호( () )를 생략.
// 기본적으로 값을 가져오는 용도 --> 반드시 어떤 값을 return.
class Person {
	age = 100;
	constructor( id, name, email ) {
		this._id = id;
		this._name = name;
		this._email = email;
	}
	get id() { return this._id; }
	get name() { return this._name; }
	get email() { return this._email; }
	set id( value ) {
		this._id = value;
	}
	set name( value ) {
		this._name = value;
	}
	set email( value ) {
		this._email = value;
	}
	info() {
		return `ID: ${ this.id }, NAME: ${ this.name }, EMAIL: ${ this.email }`;
	}
}

const p1 = new Person( "batman", "배트맨", "batman@gmail.com" );
console.log( p1.age );			// 100
// console.log( p1.name() );		// Err
console.log( p1.name );			// 배트맨

console.log( p1.info() );			// 배트맨
p1._name = "슈퍼맨";				// 슈퍼맨으로 변경.
console.log( p1.info() );			// 슈퍼맨


// [2] : setter
// setter --> 클래스 속성에 값을 할당할 때 사용.
// setter는 메서드명 앞에 set 키워드를 붙여서 사용. --> getter와 마찬가지로 메서드명을 속성처럼 사용.
// getter는 값을 취할시 --> 해당 get 메서드 호출.
// setter는 값을 할당시 --> 해당 set 메서드 호출.
console.clear();
const a1 = new Person( "antman", "앤트맨", "antman@gmail.com" );


console.log( a1.age );	// 100
a1.age = 200;
console.log( a1.age );	// 200


console.log( a1.id );		// antman
a1.id = "aaaaaaaaaaaaaaaaaaaaaaaantman";
console.log( a1.id );		// aaaaaaaaaaaaaaaaaaaaaaaantman


console.log( a1.name );		// 앤트맨
a1.name = "개미맨";
console.log( a1.name );


console.log( a1.email );
a1.email = "test@test.com";
console.log( a1.email );




























