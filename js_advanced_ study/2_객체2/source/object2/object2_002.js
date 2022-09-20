// 자바스크립트 함수의 내부와 객체간의 관계


// [1] : 함수가 만들어지고 수행이 되어지면..
// 내부에서는
// 1. 함수 자신과 예를 들면 "Animal 함수" 자신과 그리고 자신과 같은 이름의 "Animal 프로토타입 객체"가 생성.
// 2. Animal 함수 멤버로 --> prototype 속성이 생성 --> 다른 곳에 생성된 같은 함수 이름의 "Animal 프로토타입 객체"를 가리킴(참조).


function Animal() {}


// Animal 함수														Animal 프로토타입 객체
// + prototype --> Animal 프로토타입 객체(참조)						+ constructor --> Animal 함수(참조)
// 																	+ run()


// 이런 상황일 때 --> "Animal 프로토타입 객체" --> 생성자 함수와 new 연산자를 통해서 만들어내는 모든 객체의 원형이 되는 객체.


let tiger = new Animal();
let lion = new Animal();
// 이렇게 new 연산자와 생성자 함수를 이용하여 객체 생성시 각 객체에는 --> __proto__ 속성이 자동으로 생성.
// 이 속성(__proto__)은 뭔가를 가리키는데 --> 이 객체가 만들어질 수 있도록 해준 원형 --> "Animal 프로토타입 객체"를 숨은 링크로 가리킨다(참조).


console.log( tiger );
console.log( lion );

















