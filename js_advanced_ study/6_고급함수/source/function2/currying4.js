// 커링(Currying) - 파라미터 순서 바꾸기

// 일반 함수
// const curriedFeed = function(a, b, c, d) {
//     console.log(a, b, d, c);
// };
// 
// curriedFeed(100, 200, 300, 400);

// [1] : 커링 함수
const curriedFeed = function( name ) {
    return function( seperator ) {
        return function( stress ) {
            return function ( feed ) {
                return name + seperator + feed + stress;
            }
        }
    }
};

// 바둑이 --> 생선 먹이를 줬다.
const curriedFeed2 = curriedFeed('바둑이')(' --> ')(' 먹이를 줬다.');
console.log(curriedFeed2('생선'));
console.log(curriedFeed2('돼지고기'));
console.log(curriedFeed2('닭고기'));
console.log(curriedFeed2('참치'));

// [2] : 부분 적용 함수
// 커링 함수의 가장 큰 장점 중 하나 --> 인자를 부분 적용한 함수를 쉽게 만들어 낼 수 있다.
// 커링 함수에서는 인자의 수를 내가 마음대로 조절. --> 매개변수를 나타내는 함수의 집합을 쉽게 만든다.

console.log('----------------------------------');
const curriedFeedPart = curriedFeed('야옹이')(', ');
console.log(curriedFeedPart(' 먹었어?')('생선'));
console.log(curriedFeedPart(' 먹었어?')('소고기'));
console.log(curriedFeedPart(' 먹었어?')('돼지고기'));

// 먹었어? --> 먹었습니다. 로 바꾸기
console.log('----------------------------------');
console.log(curriedFeedPart(' 먹었습니다')('생선'));