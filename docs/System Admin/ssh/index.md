# ssh

## Login without password

1. Create private and public key on the local host

    ```
    ssh-keygen -t ed25519 -C "<comment>"
    ```

    ```
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (/Users/thomsun/.ssh/id_ed25519): <Enter file name>
    Enter passphrase (empty for no passphrase): <Enter passphrase or enter for no passphrase>
    Enter same passphrase again:
    Your identification has been saved in /Users/thomsun/.ssh/id_ed25519.
    Your public key has been saved in /Users/thomsun/.ssh/id_ed25519.pub.
    The key fingerprint is:
    SHA256:BAMFeuYpU7PvH8qnnQZxCmIqr1XJYpqXA0gsn9io5lg test
    The key's randomart image is:
    +--[ED25519 256]--+
    ...
    ...
    ...

    +----[SHA256]-----+
    ```

1. Copy the public key to the remote host
    ```
    ssh-copy-id -i ~/.ssh/id_ed25519.pub user@remote-host
    ```

1. To make remote host not allow password login, edit `/etc/ssh/sshd_config`
    ```
    PasswordAuthentication no   #No username password authentication
    UsePAM no                   
    PermitRootLogin no          #Disable root login
    ```