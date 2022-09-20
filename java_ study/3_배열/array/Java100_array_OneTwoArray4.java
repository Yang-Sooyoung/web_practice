// 1, 2차원 배열의 생성 및 출력을 다양한 예제로 구현해보시오.
// 이 문제는 자바 배열에 관해서 2차원 배열 위주로 생성 및 출력을 다양하게 해보는 종합문제입니다.


public class Java100_array_OneTwoArray4 {
	public static void main(String[] args) {
		
		// [1] : String 1차원 배열 --> 3개의 문자열을 담을 수 있는 배열 생성하기
		// String 타입의 참조 변수 3개를 저장하기 위한 공간 생성 --> 이때, 참조형 변수 각 요소는 기본값 --> null로 초기화.
		String[] province = new String[3];
		System.out.println( province[0] );  //--- null 출력 --;;
		System.out.println( province[1] );
		System.out.println( province[2] );
		
		// [2] : String 배열 초기화 --> 직접 입력
		province[0] = "강원도";
		province[1] = "전라도";
		province[2] = "경상도";
		System.out.println( province[1] );
		
		// [3] : String 배열 초기화 --> 배열 선언 및 생성시 { }로 동시에 초기화
		String[] nation = new String[]{ " 한국", "미국", "중국" };
		System.out.println( nation[1] );
		
		String[] flower = { "무궁화", "해바라기", "개나리" };
		System.out.println( flower[1] );
		
		// [4] : 반복문을 사용하여 배열 값 모두 출력
		for( int i=0; i < flower.length; i++ )
			System.out.print( flower[i] + " " );
		System.out.println();
		
		// [5] : 향상된 for문으로 배열 요소 출력
		for( String aaa: flower )
			System.out.print( aaa + " " );
		System.out.println();
			
		// [6] : String 2차원 배열 만들기 --> 2x3 Shape	
		// 아시아 --> 동북아시아(한국, 중국, 일본), 동남아시아(태국, 베트남, 필리핀)
		String[][] asia_nations = {
			{ "한국", "중국", "일본" },
			{ "태국", "베트남", "필리핀" },
		};
		
		System.out.println( asia_nations[0] );  //--- 동북아시아 국가를 저장하고 있는 1차원 배열의 주소를 참조하는 값이 출력 --;;
		System.out.println( asia_nations[1] );
		
		System.out.println( asia_nations[0][1] );  //--- 중국 : 실제 요소의 값 출력 --;;
		System.out.println( asia_nations[1][0] );  //--- 태국
		
		System.out.println( asia_nations.length );  		// 2
		System.out.println( asia_nations[0].length );	// 3
		System.out.println( asia_nations[1].length );	// 3
		
		// [7] : 반복문을 사용한 String 2차원 배열 값 출력
		for( int i=0; i < asia_nations.length; i++ ) {
			for( int j=0; j < asia_nations[i].length; j++ )
				System.out.print( asia_nations[i][j] + " " );
			System.out.println();
		}
		
		// [8] : charAt() 메서드 사용 --> 해당 인덱스에 있는 값을 반환 --> 단어를 char 배열에 한글자씩 저장할 수 있음.
		String[] strAr = { "hong", "kim", "park" };
		System.out.println( strAr[0].charAt(2) );  //--- n
		System.out.println( strAr[1].charAt(2) );  //--- m
		System.out.println( strAr[2].charAt(2) );  //--- r
		
		// [9] : 반복문에서 charAt() 메서드 사용
		// [9-1] 잘못된 예1
		for( int i=0; i < strAr.length; i++ )
			System.out.print( strAr[i].charAt(i) );  //--- hir --> 이중 반복문을 사용해줘야 한다 --;;
		System.out.println();
		
		// [9-2] 잘못된 예2
		for( int i=0; i < strAr.length; i++ )
			for( int j=0; j < strAr.length; j++ )
				System.out.print( strAr[i].charAt(j) );  //--- hon kim par
			System.out.println();
			
		// [9-3]
		System.out.println( strAr.length );  		// 3
		// System.out.println( strAr[0].length );	// Err
		System.out.println( strAr[0].length() );	// hong --> 4
		for( int i=0; i < strAr.length; i++ )
			for( int j=0; j < strAr[i].length(); j++ )
				System.out.print( strAr[i].charAt(j) );
			System.out.println();
			
		// [10] : length vs length()
		int[] aaa = new int[10];
		System.out.println( aaa.length );  		//--- 10
		
		String bbb = "Welcome to Seoul";
		System.out.println( bbb.length() );	//--- 16
		
	}
}




































