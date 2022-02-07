# uniq
A utility to handle duplicate lines in a file. The input must be **sorted** before

### To get unique lines
``` bash
sort file.txt | uniq
```

### To get duplicate lines
``` bash
sort file.txt | uniq -d
```

### To get duplicate count (unique line will be 1)
``` bash
sort file.txt | uniq -c
```