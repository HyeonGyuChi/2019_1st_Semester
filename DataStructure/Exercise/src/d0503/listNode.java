package d0503;

public class listNode {
	public String data;
	public listNode link;
	
	public listNode() {
		data = null;
		link = null;
	}
	//listNode »ý¼ºÀÚ
	public listNode(String val) {
		data = val;
		link = null;
	}
	
	public listNode(String val, listNode p) {
		data = val;
		link = p;
	}
	
	
	

}
