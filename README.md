# Keel

Containerised SSH tunnels

## Setup

You must setup a target ssh server for the tunnel to be created on.

You need to ensure that `GatewayPorts` is set to yes in `/etc/ssh/sshd_config`
```
GatewayPorts yes
```

SSH keys can be generated locally
```
ssh-keygen
```

And need to be copied to the target server
```
ssh-copy-id -i $YOUR_KEY -p $TARGET_PORT $TARGET_USER@$TARGET_HOST
```
