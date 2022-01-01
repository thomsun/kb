# Stream API

## boxed()
Convert primitive array to List
```java
int[] input = new int[]{1,2,3,4};
List<Integer> output = Arrays.stream(input).boxed().collect(Collectors.toList());
```
Reference - [https://www.baeldung.com/java-primitive-array-to-list](https://www.baeldung.com/java-primitive-array-to-list)