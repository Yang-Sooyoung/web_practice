// 커링(Currying) - 문자열
// 동물에게 먹이를 주는 feed() 함수가 있다.
// feed() 함수는 인자를 2개 받는데 첫 번째 인자로는 동물의 이름을 받고, 두 번째 인자로는 먹이 종류를 받는다.
// 출력 --> 바둑이에게 생선 먹이를 주고 있다.
// 이를 커링 함수로 바꾸어보시오.

// [1]: 기존 함수
const feed = function( name, feed ) {
    console.log(`${name}에게 ${feed} 먹이를 주고 있다.`);
}
feed('바둑이', '생선');

// [2]: 커링 함수
const curriedFeed = function( name ) {
    return function(feed) {
        return `${name}에게 ${feed} 먹이를 주고 있다.`; // 함수형 프로그래밍에서는 웬만하면 return으로 처리해주는게 좋다.
    }
};
console.log('----------------------------------');
const curriedFeed2 = curriedFeed('진돗개');
console.log(curriedFeed2('생선'));
console.log(curriedFeed2('미역국'));
console.log(curriedFeed2('닭고기'));

// [3]: Arrow Function 
const curriedFeedArrow = name => feed => { return `${name}에게 ${feed} 먹이를 주고 있다.`}

console.log('----------------------------------');
const curriedFeedArrow2 = curriedFeedArrow('야옹이');
console.log(curriedFeedArrow2('소고기'));
console.log(curriedFeedArrow2('돼지고기'));
console.log(curriedFeedArrow2('양고기'));