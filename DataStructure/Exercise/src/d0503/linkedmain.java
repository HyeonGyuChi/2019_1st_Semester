package d0503;

public class linkedmain {

	public static void main(String[] args) {
		linkedList L1 = new linkedList();
		
		L1.addLastNode("Na");
		L1.printList();
		L1.addLastNode("Park");
		L1.printList();
		L1.addLastNode("Lee");
		L1.printList();
		
		System.out.println("-----------Add First Node------------");
		L1.addFirstNode("Kim");
		L1.printList();
		
		System.out.println("-----------Insert Node------------");
		L1.insertNode("Na", "Ha");
		L1.printList();
		
		System.out.println("-----------Search Node------------");
		System.out.println(L1.searchNode("Kim").data);
		
		System.out.println("-----------Delete Next------------");
		L1.deleteNext("Na");
		L1.printList();

	}

}
