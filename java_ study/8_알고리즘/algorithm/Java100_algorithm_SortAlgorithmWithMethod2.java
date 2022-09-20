// 정렬 함수를 이용하여 학생들의 성적을 1등부터 꼴찌 까지 순위대로 출력해보시오.
// 내장된 메서드를 사용하면 따로 정렬 알고리즘을 만들지 않아도 된다.
// 이때, 내림차순으로 정렬한다.
// 이 문제는 따로 정렬 알고리즘을 구현하지 않고 내장된 정렬 메서드를 사용해서 정렬해보는 문제이다.


import java.util.Arrays;
import java.util.Collections;

public class Java100_algorithm_SortAlgorithmWithMethod2 {
	public static void main(String[] args) {
		
		// [1] : 배열 선언 --> 성적 배열
		// 이때, 내림차순이거나 또는 원하는대로 정렬의 조건을 설정해서 하고자 할 때 --> 기본형(PrimitiveType)의 배열에는 적용이 안된다.
		// 따라서, 래퍼 클래스로 만들어서 적용해야 한다.
		// 참고로,  String 타입은 기본형이 아니다.
		Integer[] scores = { 88, 55, 33, 100, 90, 99,  77, 66 };
		
		// [2] : 성적 배열 --> 내림차순 정렬 --> Arrays.sort(); --> import 필요 --> 추가 옵션 설정이 필요 --> (배열명, 컬렉션 reverseOrder)
		// Collections 클래스의 reverseOrder() 메서드 사용 --> import 필요.
		System.out.print( "화장실(정렬) 들어가기 전 = " );
		for( int i=0; i < scores.length; i++ ) 
			System.out.print( scores[i] + "    " ); System.out.println();
		
		// 내림차순 정렬
		Arrays.sort( scores, Collections.reverseOrder() );
		
		System.out.print( "화장실(정렬) 들어가기 후 = " );
		for( int i=0; i < scores.length; i++ ) 
			System.out.print( scores[i] + "    " ); System.out.println();
		
		// [3] : 향상된 for문 사용
		System.out.print( "화장실(정렬) 들어가기 후 = " );
		for( int i : scores )
			System.out.print( i + "    " ); System.out.println();
		
	}
}


















