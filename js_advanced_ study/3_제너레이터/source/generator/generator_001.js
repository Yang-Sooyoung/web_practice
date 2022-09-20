// 제너레이터(Generator)


// [1] : 제너레이터란 무엇인가?
// 첫째 : 함수다.
// 둘째 : 조금은 이상하게(?) 동작하는 함수.
//				- 보통 함수라 하면 값 한개(또는 없거나)를 반환하는 데 --> 얘는 여러 개의 값을 반환.
//				- 그것도 함수(제너레이터) 외부에서 함수가 실행되는 중간에 --> 특정 부분에서 멈추고 --> 값을 외부에서 받아 하나씩 반환.
// 셋째 : 외적인 특징 --> * 를 함수에 붙이면 제너레이터 함수.
// 넷째 : 함수의 실행을 --> 특정 키워드(yield)에서 멈추었다가 --> 필요한 시점에서 다시 재개 --> 왜? yield라는 단어를 썼을까? 생각!
//				- 즉, 함수 중간에서 실행을 멈춘다 --> 이때, 제어권은 호출자에게 양도(yield: 넘겨[양도]하다)하게 되고 --> 호출자에 의해 다시 재개.


function* testGen() {
	yield 1;
	yield 2;
	yield 3;
	return 4;
}


// 위 함수가 제너레이터 함수 --> 얘는 호출하면 --> 바로 코드가 실행되는 것은 X --> 호출하면 "이터레이터(iterator) 객체"를 반환.
// iterator 반복자 객체를 반환 --> 보통 it 또는 iter 라는 이름으로 받는다.
// 객체니깐 내부적으로 어떤 메서드를 가지게 되는데 --> next() 메서드(제너레이터의 주요 메서드)


const iter = testGen();		// iterator 객체를 반환 --> 이 객체에는 --> next() 메서드가 존재 --> next() 실행될 때 마다, 
							// 처음 나오는 yield 부분까지 실행하고 멈춘다. (또는 제어권을 호출자에게 양도한다.)
							// yield에서 멈췄을 때 --> yield 뒤의 "값(value)"을 반환.
							// 만약, yield 키워드 뒤에 아무런 "값"이 없다면 --> undefined 반환.
							// 결론 --> next() 메서드 --> 항상 value, done 2개의 속성을 가진 "객체"를 반환.
							// 어떻게? --> { value: 1, done: false }
							// value는 yield 뒤의 값, done은 함수 코드 실행이 끝났으면 true, 아니면 false를 반환.


console.log( iter.next() );	// { value: 1, done: false }
console.log( iter.next() );	// { value: 2, done: false }
console.log( iter.next() );	// { value: 3, done: false }
console.log( iter.next() );	// { value: 4, done: true }


// 동작
// next() --> yield --> next() --> yield 이러한 식의 순환으로 동작이 진행.
// 이러한 흐름대로 해당 함수가 종료될 때까지 진행이 됨. 보통 return 을 만나면서 종료.





// 제너레이터(Generator) 함수 바깥의 외부에서 데이터 받기


// [ ! ] : 이게 가능한 이유?
// next() 메서드와 yield가 중간에서 번갈아가면서 데이터를 주고 받기 때문. (탁구 핑퐁핑퐁)
// next() 메서드 호출 --> yield 키워드까지 실행하고(stop) --> 제어권을 함수 외부로 양도(yield) --> 이때 yield 뒤의 값이 반환.


console.clear();
console.log( '---------------------------------------------' );
function* testGen2() {
	const a = yield 1;
	const b = yield (a * 1);
	const c = yield (b + 2);
	return a * b * c;
}

const iter2 = testGen2();
console.log( iter2.next() );				// 					{ value: 1 , 		done: false }
console.log( iter2.next(100) );			// a = 100	-->		{ value: 100 ,	done: false }
console.log( iter2.next(48) );			// b = 48	-->		{ value: 50 , 		done: false }
console.log( iter2.next(2) );				// c = 2		--> 	{ value: 9600 , 	done: true }


// 정리
// 위 코드의 값을 바꿔가면서 next() 메서드 실행시 어떤 값이 반환될지를 연습. ★
// 위 실습을 통해서 알 수 있듯이, 제너레이터 함수와 이터레이터 객체의 next() 메서드는 서로 데이터를 주고 받을 수 있다라는 점.





































