// 정렬 함수를 이용하여 학생들의 성적을 꼴찌부터 1등 까지 순위대로 출력해보시오.
// 내장된 메서드를 사용하면 따로 정렬 알고리즘을 만들지 않아도 된다.
// 이때, 오름차순으로 정렬한다.
// 이 문제는 따로 정렬 알고리즘을 구현하지 않고 내장된 정렬 메서드를 사용해서 정렬해보는 문제이다.


import java.util.Arrays;

public class Java100_algorithm_SortAlgorithmWithMethod {
	public static void main(String[] args) {
		
		// [1] : 배열 선언 --> 성적 배열
		int[] scores = { 88, 55, 39, 100, 90, 100, 98, 67 };
		
		// [2] : 성적 배열 --> 오름차순 정렬 --> Arrays.sort(배열명); --> 오름차순이 기본정렬 --> import 필요.
		// 클래스 메서드로써 Arrays 클래스의 인스턴스 생성없이 바로 사용 가능.
		System.out.print( "화장실(정렬) 들어가기 전 = " );
		for( int i=0; i < scores.length; i++ ) 
			System.out.print( scores[i] + "    " ); System.out.println();
		
		Arrays.sort( scores );
		
		System.out.print( "화장실(정렬) 들어가기 후 = " );
		for( int i=0; i < scores.length; i++ )
			System.out.print( scores[i] + "    " ); System.out.println();
		
		// [3] : 향상된 for문 사용
		System.out.print( "화장실(정렬) 들어가기 후 = " );
		for( int i : scores )
			// System.out.print( scores[i] );  // Err
			System.out.print( i + "    " ); System.out.println();
		
	}
}


























