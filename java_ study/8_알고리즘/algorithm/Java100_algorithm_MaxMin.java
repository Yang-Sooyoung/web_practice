// 랜덤으로 정수 10개의 값을 갖는 배열을 만들어 최댓값과 최솟값을 같이 출력해보시오.
// 이때, 랜덤 정수 값은 0~9 사이로 한다.
// 이 문제는 랜덤 숫자 생성과 최댓값, 최솟값 알고리즘을 다 같이 사용할 수 있는지를 묻는 문제이다.


public class Java100_algorithm_MaxMin {
	public static void main(String[] agrs) {
		
		// [1] : 정수 배열 선언
		int[] ar = new int[10];
		
		// [2] : 반복문을 돌면서 랜덤으로 10개 정수 값을 셋팅 --> Math.random()
		for( int i=0; i < ar.length; i++ ) {
			ar[i] = (int)(Math.random() * 100);  //--- 무작위로 숫자(double type)를 반환 --;;
			System.out.print( ar[i] + " " );
			// System.out.println( (int)(Math.random() * 10) );
		}
		System.out.println();
		
		// [3] : 최댓값, 최솟값 변수 초기화
		int max = ar[0], min = ar[0];
		
		// [4] : 반복문을 돌면서 최댓값, 최솟값 비교
		for( int i=0; i < ar.length; i++ ) {
			if( max < ar[i] ) max = ar[i];
			if( min > ar[i] ) min = ar[i];
		}
		
		// [5] : 출력
		System.out.println( "--------------------------" );
		System.out.println( "ar 배열내 최댓값 : " + max );
		System.out.println( "ar 배열내 최솟값 : " + min );
		System.out.println( "--------------------------" );
		
	}
}






























