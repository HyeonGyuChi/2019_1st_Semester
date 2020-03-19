package Chap_1;

public class test {

	public static void main(String[] args) {
		CalFormula op = new CalFormula();
		String exp = "(3*5)-(6/2)";
		
		System.out.println("¼ö½Ä : " + exp);
		
		if(op.parenTest(exp)) {
			System.out.println("°ıÈ£ÀÇ ½Ö ÀÏÄ¡");
		}
		else {
			System.out.println("°ıÈ£ÀÇ ½Ö ºÒÀÏÄ¡");
		}
		
		op.convPostfix(exp);

	}

}
