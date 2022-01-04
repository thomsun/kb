# Samba

## Configuration

To allow samba to follow symlinks
```
# Global
allow insecure wide links = yes 

# Profile
follow symlinks = yes
wide links = yes
```

To allow older version of samba client to connect
```
server min protocol = NT1
```

## Administration
To add samba user

1. Add user linux user account first
```
sudo useradd john
sudo passwd john
```

2. Add Samba user
```
sudo smbpasswd -a john
```

3. To modify existing user
```
sudo smbpasswd john
```

To restart samba server
```
sudo service smbd restart
```

To add existing user to a group
```
sudo usermod -a -G <group> <user>
```

To add a new group
```
sudo groupadd mynewgroup
```