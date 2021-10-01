package kr.or.ddit.vo;

import kr.or.ddit.enumpkg.OperatorType;

public class CalcVO {
	private double leftOp;
    private OperatorType operator;
    private double rightOp;
//  private String expression;

    //java bean 규약에 의해 attr 이 없어도 에러가 없다.
    //마샬링 과정에서만 쓰는것이라면 생략이 가능하다
    public String getExpression() {
		return operator.makeExpression(leftOp, rightOp);
	}
	public double getLeftOp() {
		return leftOp;
	}
	public void setLeftOp(double leftOp) {
		this.leftOp = leftOp;
	}
	public OperatorType getOperator() {
		return operator;
	}
	public void setOperator(OperatorType operator) {
		this.operator = operator;
	}
	public double getRightOp() {
		return rightOp;
	}
	public void setRightOp(double rightOp) {
		this.rightOp = rightOp;
	}
	
	@Override
	public String toString() {
		return "CalcVO [leftOp=" + leftOp + ", operator=" + operator + ", rightOp=" + rightOp + "]";
	}
    
    
}