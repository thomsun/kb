# cut
Remove sections from each line of files

### To get specific column
``` bash
$ echo "1,2,3,4,5" | cut -d ',' -f 1-4
1,2,3,4

$ echo "1,2,3,4,5" | cut -d ',' -f 2-
2,3,4,5

$ echo "1,2,3,4,5" | cut -d ',' -f -3
1,2,3
```