# File Renaming

## Ubuntu package

`sudo apt install rename`

## Patterns

### Remove `(x123) 1234x1234`

Plain

```shell
# -n is for dry run
# -v is verbose
$ file-rename -v -n 's/ \(x\d+\) \d{4}x\d{4}//' *
```

Use with `find`

```shell
# verify command with echo
# -type d search for folder
# -links 2 search for bottom folder
$ find . -type d -links 2 -execdir echo "file-rename -v -n 's/ \(x\d+\) \d{4}x\d{4}//' '{}'" \;

# run the command
# remove -n to actually rename
$ find . -type d -links 2 -execdir sh -c "file-rename -v -n 's/ \(x\d+\) \d{4}x\d{4}//' '{}'" \;
```

Reformat date

```shell
$ find . -type d -links 2 -execdir sh -c "file-rename -v -n 's/(\d\d)-(\d\d)-(\d\d)/- 20\$1-\$2-\$3 -/' '{}'" \;
```