# Client

1. Install wireguard
    ```
    sudo apt install resolvconf wireguard-dkms wireguard-tools 
    ```

1. Create config file `/etc/wireguard/wg0.conf`
    ```
    [Interface]
    PrivateKey = <private key>
    Address = <assigned ip address>
    #DNS = <DNS>
    Table = off
    #PostUp = ip rule add from <docker vpn subnet> table 200; ip route add default dev %i table 200;
    #PostDown = ip rule del from <docker vpn subnet> table 200;


    [Peer]
    PublicKey = <public key>
    PresharedKey = <preshared key>
    AllowedIPs = 0.0.0.0/0
    Endpoint = <server ip address>:51820
    PersistentKeepalive = 25
    ```

    Note that `PostUp` and `PostDown` are for docker vpn set up

1. Set file permission
    ```
    sudo chmod 600 /etc/wireguard/wg0.conf
    ```

1. Start the vpn interface
    ```
    sudo wg-quick up wg0 
    ```

1. Verify connection
    - Check interface and IP address
        ```
        ip addr
        ```
        Should see something like this 
        ```
        3: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
        link/none
        inet 10.101.183.193/32 scope global wg0
        valid_lft forever preferred_lft forever
        ```

    - Confirm connection
        ```
        sudo wg show
        ```
    
    - Check external IP using both interfaces making sure it returns different IP
        ```
        curl ifconfig.me
        ```
        ```
        curl --interface wg0 ifconfig.me
        ```
1. Enable wireguard at start up
    ```
    systemctl enable wg-quick@wg0
    ```

1. To disable wireguard, run
    ```
    systemctl disable wg-quick@wg0
    ```
