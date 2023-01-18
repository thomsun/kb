# ddclient

## Overview

[`ddclient`](https://ddclient.net/) is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Service Provider.

I will use this to update my public IP to my cloudflare account

## Installation

### Install the package

Ubuntu
```
sudo apt install ddclient
```

This will bring the configuration wizard. If it doesn't or you want to rerun the wizard again, run `sudo dpkg-reconfigure ddclient`
- Select dynamic DNS provider - `Other` and then select `cloudflare`
- Leave blank to use default cloudflare protocol
- Skip proxy
- Enter username and global API key
- Select 'Web-based IP discovery service' and select one of the ip discovery service i.e. 'https://api.ipify.org'
- Select IP checking interval i.e. '300s', '5m',  '7h', or '1d'
- Enter hostname


### Verify configuration

See the configuration 
```
sudo less /etc/ddclient.conf
```

I found that the configure wizard put domain to update without key and it doesn't work. The solution is to add `zone`  (and optional `ssl`) before the domain(s) to update
```
zone=<domain tld>
ssl=yes
```

### Verify the result

Try to run 
```
sudo ddclient -daemon=0 -noquiet -debug 
```

### Verify if the daemon is running
```
ps -ef | grep ddclient
```

It should print something like `root      107909       1  0 22:39 ?        00:00:00 ddclient - sleeping for 2620 seconds`