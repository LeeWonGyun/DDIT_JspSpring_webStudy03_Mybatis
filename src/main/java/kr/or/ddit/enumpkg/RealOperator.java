package kr.or.ddit.enumpkg;

@FunctionalInterface
public interface RealOperator {
	//메소드의 시그니처. 사용방법만을 정의한다.
	public double operate(double leftOp, double rightOp);
	//메소드가 하나여서 람다화 할 수 있다
}
