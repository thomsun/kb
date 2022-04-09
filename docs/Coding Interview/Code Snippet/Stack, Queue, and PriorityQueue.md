
## Stack
`Stack` in Java is an old implementation that uses `Vector`. The modern one we should use is

```java
Deque<Integer> stack = new LinkedList<>();
stack.push(1);
int value = stack.pop();
int peekValue = stack.peek();
```

This is easier to remember than `addFirst(e)`, `removeFirst()`, and `peekFirst()`

## Queue
The good thing of Java's implementation is `LinkedList` can be used as both stack and queue.

```java
Queue<Integer> queue = new LinkedList<>();
```

Also, even better, `Deque` is sub interface of `Queue` so `Deque` actually has all queue operations as well as stack.

```java
Deque<Integer> queue = new LinkedList<>();
queue.add(1);
int value = queue.remove();
int peekValue = queue.peek();
```

In summary, we can use `LinkedList` with `Deque` interface as a stack or a queue. 

Stack

- `stack.push()`
- `stack.pop()`
- `stack.peek()`

Queue

- `queue.add()`
- `queue.remove()`
- `queue.peek()`

## PriorityQueue
If we can skip `Heap` implementation, let's use `PriorityQueue`

It can be created from other collections like
```java
PriorityQueue<Integer> heap = new PriorityQueue<>(Collection c);
PriorityQueue<Integer> heap = new PriorityQueue<>(PriorityQueue c);
PriorityQueue<Integer> heap = new PriorityQueue<>(SortedSet c);
```

Default sorting is `natural ordering`. In case we want custom or reverse order
```java
PriorityQueue<Integer> heap = new PriorityQueue<>(Comparator c);

// For example
PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Comparator.reverseOrder());
PriorityQueue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);
PriorityQueue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b.compareTo(a);
```