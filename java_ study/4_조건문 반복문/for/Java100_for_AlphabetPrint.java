// 알파벳 26개 문자를 대문자로 출력하는 반복문을 구현하시오.
// 이 문제는 알파벳 문자중 대문자 아스키 코드에 대해서 알고 그것을 반복문으로 출력할 수 있는지를 묻는 문제이다.


public class Java100_for_AlphabetPrint {
	public static void main(String[] args) {
		
		// for 반복문 --> A(65) ~ Z(90)
		for ( int i=65; i <= 90; i++ ) {
			System.out.print( (char)i + " " );  // A B C D E F .............................. Z 
		}
		System.out.println();
		
	}
}

