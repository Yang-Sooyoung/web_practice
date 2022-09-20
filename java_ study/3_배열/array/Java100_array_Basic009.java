// 배열을 복사하는 메서드를 말해보고 관련된 예제 코드를 구현해보시오.
// 이 문제는 배열 복사시 사용하는 메서드명과 사용법에 대해서 알고 있는지를 묻는 문제이다.


// [ ! ] : 배열 복사하기
// arraycopy() 메서드 사용 --> 사용법 --> System.arraycopy( 원본배열명, ???, 복사배열명, ???, 길이 );
import java.util.Arrays;

public class Java100_array_Basic009 {
	public static void main(String[] args) {
		
		// [1] : ar, ar2 배열 선언
		int[] ar = { 1, 2, 3, 4, 5 };
		int[] ar2 = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		
		// [2] : 배열 복사하기 --> System.arraycoopy()
		System.arraycopy( ar, 2, ar2, 4, 3 );  // [ 1, 2, 3, 4, 3, 4, 5, 8, 9, 10 ]
		System.out.println( Arrays.toString(ar) );
		System.out.println( Arrays.toString(ar2) );
		
	}
}


















