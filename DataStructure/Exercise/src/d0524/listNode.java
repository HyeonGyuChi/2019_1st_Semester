package d0524;

public class listNode {

		int coef;
		int exp;
		listNode link;
		
		public listNode() {
			coef = 0;
			exp = 0;
			link = null;
		}

		public listNode(int c) {
			coef = c;
			exp = 0;
			link=null;
		}
		
		public listNode(int c, int e) {
			coef = c;
			exp = e;
			link = null;
		}
		
		public listNode(int c, int e, listNode p) {
			coef = c;
			exp = e;
			link = p;
		}

		


		
	

}
