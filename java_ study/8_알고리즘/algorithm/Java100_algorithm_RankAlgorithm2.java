// 학생들의 성적을 1등 부터 순위를 매겨서 출력해보시오.
// 이 문제는 순위(Ranking) 알고리즘에 대해서 알고 있는지를 묻는 문제이다.


import java.util.Arrays;

public class Java100_algorithm_RankAlgorithm2 {
	
	public static void printRanking( int[] scores, int[] ranking ) {
		// 배열 길이
		int scores_len = scores.length;
		int ranking_len = scores_len;
		// System.out.println( scores_len );
		
		System.out.println( "총 "+ scores_len +"명 학생의 성적과 등수는?" );
		for( int i=0; i < scores_len; i++ )
			System.out.print( scores[i] +"점 --> "+ ranking[i] + "등            " );
		System.out.println();
	}
	
	public static void main(String[] args) {
		
		// [1] : 배열 선언 --> 성적 배열, 랭킹 배열 2가지
		int[] scores = { 88, 50, 38, 100, 90, 100, 99, 75 };
		int s_len = scores.length;
		int[] ranking = new int[s_len];
		
		// [1.5] : 오름차순으로 배열 정렬 --> Arrays.sort(배열명); --> import 필요.
		Arrays.sort( scores );
		
		// [2] : 반복문을 돌면서 랭킹 처리
		for( int i=0; i < s_len; i++ ) {
			
			// 랭킹 초기화 --> 0 --> 일단은 전부 1등으로 초기화
			ranking[i] = 1;
			// System.out.print( ranking[i] + " " );
			
			// 중첩 반복문
			for( int j=0; j < s_len; j++ )
				// System.out.println( scores[i] +" - "+ scores[j] );  // 이게 핵심! --> 중첩 반복문을 돌면서 i, j 번째 값을 비교한다.
				if( scores[i] < scores[j] )
					ranking[i]++;
			
		}
		
		// [3] : 출력 --> 별도의 메서드 호출
		printRanking( scores, ranking );
		
	}
	
}











