// static 선언이 안되어있는 메서드를 사용하는 방법에 대해서 코드로 구현해보시오.
// 이 문제는 메인 메서드에서 static 선언이 없는 메서드를 사용하는 방법에 대해서 아는지를 묻는 문제이다.
// 참고로 이 문제는 클래스와 객체에 대한 선행 학습이 필요하므로 이에 대한 학습 후 본 문제를 다시 풀어보는 것이 좋다.


public class Java100_method_ExamStatic2 {
	
	public void helloWorld() {
		System.out.println( "Hello, World~" );
	}
	
	public static void main(String[] args) {
		
		// [1] : 메서드 호출
		// helloWorld();  //--- 메인 메서드는 static 메서드만 호출할 수 있기 때문에 에러 --;;
		
		// [2] : 객체 생성 후 메서드 호출
		Java100_method_ExamStatic2 jes = new Java100_method_ExamStatic2();
		jes.helloWorld();
		
	}
	
}