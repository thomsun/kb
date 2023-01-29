# ddclient

## Overview

[`ddclient`](https://ddclient.net/) is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Service Provider.

I will use this to update my public IP to my cloudflare account

## Installation

### Install the package

It's better to install it from homebrew in order to get latest version. I found that Ubuntu has v3.8.1 that doesn't work well with Cloudflare API
```
brew install ddclient
```

### Create API key

- Log in to Cloudflare and create an API key by go to `My Profile` -> `API Tokens`
- Click `Create Token`
- Give the following permission
    - Zone - Zone - Read
    - Zone - DSN - Edit
    - Zone Resources - All zones

### Update configuration

Open the file `$(brew --prefix)/etc/ddclient.conf`. It has templates for different providers. What's work for me with Cloudflare is following
```
use=web, web=https://api.ipify.org/

protocol=cloudflare,        \
zone=domain.tld,            \
ttl=1,                      \
password='<API key>'
domain.tld
```
### Verify the result

Try to run 
```
ddclient -daemon=0 -noquiet -debug -verbose -file $(brew --prefix)/etc/ddclient.conf
```

It will show all the interaction with the API.

Unfortunately, Cloudflare API doesn't update some tld. So, I will need to update IP manually until I pay for my domain
```
You cannot use this API for domains with a .cf, .ga, .gq, .ml, or .tk TLD (top-level domain)
```

### Verify if the daemon is running

Not sure if this works with homebrew version or not
```
ps -ef | grep ddclient
```

It should print something like `root      107909       1  0 22:39 ?        00:00:00 ddclient - sleeping for 2620 seconds`