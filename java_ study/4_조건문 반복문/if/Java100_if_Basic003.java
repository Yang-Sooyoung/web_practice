// if ~ else if ~ else 조건문의 사용법을 예제로 설명해보시오.
// 이 문제는 자바의 if ~ else if ~ else 조건문을 사용할 수 있는지에 대해서 묻는 문제이다.


public class Java100_if_Basic003 {
	public static void main(String[] args) {
		
		// [1] : 변수 선언
		int kor=0, eng=80, math=90;
		int total_score;
		total_score = kor + eng + math;
		
		// [2] : if ~ else if ~ else 조건문 사용하기
		if( total_score >= 270 ) {
			System.out.println( "당신의 토탈 점수는 "+ total_score +"입니다. 매우 매우 잘했어요~" );
			System.out.println( "축하해요~" );
		}
		else if ( total_score >= 240 ) {
			System.out.println( "당신의 토탈 점수는 "+ total_score +"입니다. 잘했어요~" );
		}
		else if ( total_score >= 210 ) {
			System.out.println( "당신의 토탈 점수는 "+ total_score +"입니다. 노력하세요~" );
		}
		else {
			System.out.println( "당신의 토탈 점수는 "+ total_score +"입니다. 음......................ㅠ.ㅠ" );
		}
		
	}
}

















