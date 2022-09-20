// 사용자 입력을 받아 2차원 배열을 생성하고 값을 입력하는 코드를 구현하시오.
// 이때, 중첩 반복문을 사용하여 출력도 같이 해보시오.
// 이 문제는 배열 생성시 사용자로 부터 입력을 받아서 2차원 배열을 만들 수 있는지를 묻는 문제이다.

 
 import java.util.Scanner;
 
 public class Java100_array_TwoArrayUserInput {
	 public static void main(String[] args) {
		 
		 // [1] : 사용자 입력을 위한 객체 선언
		 Scanner sc = new Scanner(System.in);
		 
		 // [2] : 2차원 배열의 행과 열 선언 --> 사용자 입력으로 처리
		 System.out.print( "행의 갯수를 입력하고 [Enter] 치세요 = " );
		 int R = sc.nextInt();
		 System.out.print( "열의 갯수를 입력하고 [Enter] 치세요 = " );
		 int C = sc.nextInt();
		 
		 // [3] : char 2차원 배열 선언 --> 사용자로 부터 R, C 입력받아 --> gameMap[R][C] 생성.
		 char[][] gameMap = new char[R][C];
		 
		 // [4] : 사용자 입력을 받아서 저장할 String 배열 선언 --> 이때 크기를 [R]로 해주도록 한다.(★)
		 // 크기를 R 만큼만 해주면 되는 이유? --> 어차피 사용자가 입력하는 값은 안쪽 for문을 돌면서 2차원 배열에 입력하기 때문이다.
		 String[] strAr = new String[R]; 
		 
		 // [5] : 2차원 배열 요소 --> 사용자가 입력하는 값으로 셋팅
		 for( int i=0; i < R; i++ ) {
			 System.out.print( "1번째 행에 입력할 문자 5개를 차례대로 입력하고 [Enter] 치세요 = " );
			 strAr = sc.next();
			 for( int j=0; j < C; j++ ) {
				 gameMap[i][j] = strAr[i].charAt(j);
 			 }
		 }
		 
	 }
 }








 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 