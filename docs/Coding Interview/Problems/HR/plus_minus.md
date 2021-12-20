# Plus Minus

## Problem
Given an array of integers, calculate the ratios of its elements that are positive, negative, and zero. Print the decimal value of each fraction on a new line with 6 places after the decimal.

## Solution
The calculation is simple. The key is to format the number correctly. As all of us know, double/float in Java can be weird.

### Solution 1: Use `printf` formatting
Calculate the percentage normall and use `printf` formatting to format the number. This is probably the most straightforward way to solve this problem
``` java
    public static void plusMinus(List<Integer> arr) {
        double p = 0, n = 0, z = 0;
        for (int i : arr) {
            if (i == 0) z++;
            else if (i < 0) n++;
            else if (i > 0) p++;
        }

        System.out.printf("%8.6f\n", p/arr.size());
        System.out.printf("%8.6f\n", n/arr.size());
        System.out.printf("%8.6f\n", z/arr.size());
    }
```

### Solution 2: Use `BigDecimal`
We can use `BigDecimal` to do calculation with speficy precision. This is probably a bit overkill for interview solution. But, use BigDecimal is a good practice if your appliation is related to cost or money where it has a specific way to round the number.

Note that when dividing numbers using BigDecimal, we should always set `scale` otherwise it can throws `ArithmeticException` as by default it will try to return *exact* precision.

``` java
    public static void plusMinus(List<Integer> arr) {
        int p = 0, n = 0, z = 0;
        for (int i : arr) {
            if (i == 0) z++;
            else if (i < 0) n++;
            else if (i > 0) p++;
        }

        BigDecimal size = BigDecimal.valueOf(arr.size());
        System.out.println(BigDecimal.valueOf(p).divide(size, 6, RoundingMode.HALF_UP));
        System.out.println(BigDecimal.valueOf(n).divide(size, 6, RoundingMode.HALF_UP));
        System.out.println(BigDecimal.valueOf(z).divide(size, 6, RoundingMode.HALF_UP));
    }
```
