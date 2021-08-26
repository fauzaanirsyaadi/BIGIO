package JawabanNomor19;

import org.junit.jupiter.api.Test;

public class LinkedList {
    // Head of list
    static Node head;

    // Linked list Node
    static class Node
    {
        int data;
        Node next;

        Node(int d)
        {
            data = d;
            next = null;
        }
    }
    /* Inserts a new Node at front of the list. */
    static public void push(int new_data)
    {
    /* 1 & 2: Allocate the Node &
              Put in the data*/
        Node new_node = new Node(new_data);
        /* 3. Make next of new Node as head */
        new_node.next = head;
        /* 4. Move the head to point to new Node */
        head = new_node;
    }
    // Function to detect first node of loop
// in a linked list that may contain loop
    static boolean detectLoop(Node h)
    {
        // If the head is null we will return false
        if (head == null)
            return false;
        else
        {
            // Traversing the linked list
            // for detecting loop
            while (head != null)
            {
                // If loop found
                if (head.data == -1)
                {
                    return true;
                }

                // Changing the data of visited node to any
                // value which is outside th given range
                // here it is supposed the given range is (1
                // <= Data on Node <= 10^3)
                else
                {
                    head.data = -1;
                    head = head.next;
                }
            }

            // If loop not found return false
            return false;
        }
    }

    // Driver Code
    @Test
    public void TestLink()
    {
        LinkedList llist = new LinkedList();

//        test1
//        llist.push(1);
//        llist.push(2);
//        llist.push(3);
//        llist.push(1);

        /* Create a loop for testing */
//        llist.head.next.next.next.next = llist.head.next.next;

//        test 2
        llist.push(1);
        llist.head.next = llist.head.next;

        if (detectLoop(llist.head))
            System.out.println("1");
        else
            System.out.println("0");
    }
}
