# Client

- Install cifs utils
```
sudo apt-get install cifs-utils
```

- Create mount point
```
sudo mkdir /mnt/windowshare
```

- Create credential file (optional)
  
    - For protected folder, create a credential in home folder `~/.smbcredentials` as following 
    ```
    username=<msusername>
    password=<mspassword>
    ```

    - Make sure the file has the right permission
    ```
    chmod 600 ~/.smbcredentials
    ```

- Add the mount point to `/etc/fstab`

Guest (not sure didn't make it work)
```
//servername/sharename /media/windowsshare cifs guest,iocharset=utf8 0 0
```

User
```
//servername/sharename /media/windowsshare cifs credentials=/home/<ubuntuusername>/.smbcredentials,iocharset=utf8 0 0
```

Add `uid` and/or `guid` for file permission. To find IDs of the user, run `id <username>`
```
//servername/sharename /media/windowsshare cifs credentials=/home/<ubuntuusername>/.smbcredentials,uid=1000,gid=1000,iocharset=utf8 0 0
```

If there is any space in the server path, you need to replace it by `\040`, for example `//servername/My\040Documents` 

- Mount the mount point
```
sudo mount -a
```
