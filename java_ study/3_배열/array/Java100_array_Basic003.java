// 배열 요소에 데이터 값을 넣으려면 어떻게 해야하는지 작성해보시오.
// 이 문제는 배열을 생성한 후에 데이터 값을 입력하는 방법에 대해서 아는지를 묻는 문제이다.


public class Java100_array_Basic003 {
	public static void main(String[] args) {
		
		// [1] : 배열 선언
		int[] sales_table = new int[5];
		
		// [2] : 선언한 배열 공간에 값 입력하기
		sales_table[0] = 3;
		sales_table[1] = 11;
		sales_table[2] = 22;
		sales_table[3] = 33;
		sales_table[4] = 44;
		
		// [3] : 값 출력하기
		System.out.println( sales_table[0] );  // 3
		System.out.println( sales_table[1] );  // 11
		System.out.println( sales_table[2] );  // 22
		System.out.println( sales_table[3] );  // 33
		System.out.println( sales_table[4] );  // 44
		System.out.println( sales_table[ sales_table.length - 1 ] );  // 44
		
	}
}







