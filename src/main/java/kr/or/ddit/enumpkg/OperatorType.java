package kr.or.ddit.enumpkg;

public enum OperatorType {
   PLUS('+', new RealOperator() {
      public double operate(double leftOp, double rightOp) {
         return leftOp + rightOp;
      };
   }), MINUS('-', (leftOp, rightOp) -> {return leftOp-rightOp;})
     , MULTI('*', (leftOp, rightOp) -> {return leftOp*rightOp;})
     , DIV('/', (leftOp, rightOp) -> {return leftOp/rightOp;})
     , MOD('%', (leftOp, rightOp) -> {return leftOp%rightOp;});
   
   private OperatorType(char sign, RealOperator operator) {
      this.sign = sign;
      this.operator = operator;
   }

   private char sign;
   private RealOperator operator;
   private static final String PATTERN = "%f %s %f = %f";
   
   public double operate(double leftOp, double rightOp) {
      return operator.operate(leftOp, rightOp);
   }
   
   public String makeExpression(double leftOp, double rightOp) {
      return String.format(PATTERN, leftOp, sign, rightOp, operate(leftOp, rightOp));
   }
   
   public char getSign() {
      return sign;
   }
   
   
   
}