# sed
Stream editer for filtering and transforming text

### To replace simple strings
``` bash
$ echo "before before before" | sed 's/before/after/'
after before before

# with 'g', sed will replace all instances in the lines
$ echo "before before before" | sed 's/before/after/g'
after after after
```

### To replace strings with regex
``` bash
$ echo "string1,ID-123,string2,ID-345" | sed 's/,ID-[0-9]\{3\}//g'  
string1,string2
```

## Reference
[50 sed command examples](https://linuxhint.com/50_sed_command_examples)