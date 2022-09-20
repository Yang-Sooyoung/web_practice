// 커링(Currying) - ES6 Arrow Function
// (문제) 인자를 3개 받아서 모두 더하는 기존 함수를 커링 함수로 바꾸어보시오.
// 이때, 화살표 함수를 사용하여 한 라인으로 구현하시오.

// [1]: 기존 함수 --> 인자를 3개 받아서 더하는 함수
function sum1 (x, y, z) {
    return x + y + z;
}
console.log(sum1(3,4,5));
console.log('--------------------------');

// [2]: 커링 함수 --> 단일 인자만 받아서 처리
function sum(x) {
    return function(y) {
        return function (z) {
            return x + y+ z;
        }
    }
}

const sum2 = sum(3);
const sum3 = sum2(7);
console.log(sum3(9));
console.log("--------------------------");
console.log(sum(4)(7)(5));

// [3]: Arrow Function 
console.clear();
const sumArrowFunc = x => y => z => x+y+z;
const sumArrowFunc2 = sumArrowFunc(111);
const sumArrowFunc3 = sumArrowFunc2(222);
console.log(sumArrowFunc3(333));
console.log("--------------------------");

console.log(sumArrowFunc(44)(55)(66));
