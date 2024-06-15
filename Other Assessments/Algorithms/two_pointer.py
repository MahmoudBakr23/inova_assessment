class ListNode:
    def __init__(self, value=0, next=None):
        self.value = value
        self.next = next

def findMiddleNode(head):
    if head is None:
        return None

    slowPointer = head
    fastPointer = head

    while fastPointer is not None and fastPointer.next is not None:
        slowPointer = slowPointer.next
        fastPointer = fastPointer.next.next

    return slowPointer

# Example usage:
# Creating the linked list 1 -> 2 -> 3 -> 4 -> 5
head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
middle = findMiddleNode(head)
# The output should be the node with value 3

# Creating the linked list 1 -> 2 -> 3 -> 4 -> 5 -> 6
head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6))))))
middle = findMiddleNode(head)
# The output should be the node with value 4
