package d0517;
public class linkedmain {

	public static void main(String[] args) {
		linkedList L1 = new linkedList();
		linkedList L2 = new linkedList();
		linkedList L;
		
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
		L1.deleteNext("Ha");
		L1.printList();

		System.out.println("-------Reverse method------");
		L1.reverse();
		L1.printList();
		
		System.out.println("------Add list------");
		L2.addLastNode("add-1");
		L2.addLastNode("add-2");
		L2.addLastNode("add-3");
		
		L = linkedList.addList(L1, L2);
		L.printList();
/*		System.out.println("-----print L1, L2-----");
		L1.printList();
		L2.printList(); */
		
	}

}
