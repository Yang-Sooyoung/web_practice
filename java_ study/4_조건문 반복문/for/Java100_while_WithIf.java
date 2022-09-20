// 홀수, 짝수 구하기 문제를 while 반복문을 사용하여 구현해보시오.
// 1~30 까지의 수에서 짝수만 출력하시오.
// 이 문제는 while 반복문과 그 안에서 조건문을 사용할 수 있는지를 묻는 문제이다.


public class Java100_while_WithIf {
	public static void main(String[] args) {
		
		// [1] : 변수 선언
		int number = 1;
		
		// [2] : 반복문을 돌면서 홀수, 짝수 체크
		while( number <= 30 ) {
			// 짝수이면 출력
			if( number % 2 == 0 )
				System.out.print( number + " " );
			
			// 반복문을 빠져나오기 위해서는 number 값을 반복 때 마다 증가.
			number++;
		}
		System.out.println();
		
	}
}












