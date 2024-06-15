class MaxPriorityQueue:
    def __init__(self, size):
        self.queue = [None] * size
        self.size = size
        self.count = 0  # Number of elements in the queue

    def is_empty(self):
        return self.count == 0

    def is_full(self):
        return self.count == self.size

    def enqueue(self, element, priority):
        if self.is_full():
            print("Priority Queue is full")
            return
        # Insert the new element based on its priority
        i = self.count - 1
        while i >= 0 and self.queue[i][1] < priority:
            self.queue[i + 1] = self.queue[i]
            i -= 1
        self.queue[i + 1] = (element, priority)
        self.count += 1

    def dequeue(self):
        if self.is_empty():
            print("Priority Queue is empty")
            return None
        element = self.queue[0][0]
        for i in range(1, self.count):
            self.queue[i - 1] = self.queue[i]
        self.queue[self.count - 1] = None
        self.count -= 1
        return element

    def display(self):
        if self.is_empty():
            print("Priority Queue is empty")
        else:
            print("Priority Queue elements:", [(elem, prio) for elem, prio in self.queue[:self.count]])

# Example usage
if __name__ == "__main__":
    pq = MaxPriorityQueue(5)
    pq.enqueue('A', 1)
    pq.enqueue('B', 3)
    pq.enqueue('C', 2)
    pq.display()  # Should display elements in priority order: [('B', 3), ('C', 2), ('A', 1)]
    print(pq.dequeue())  # Should dequeue 'B' with priority 3
    pq.display()  # Remaining elements: [('C', 2), ('A', 1)]
