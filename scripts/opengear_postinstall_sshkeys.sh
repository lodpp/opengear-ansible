#!/bin/bash

# user ROOT keys
cat > /etc/config/ssh_authorized_keys << EOF
ssh-rsa key1
ssh-rsa key2
ssh-rsa key3
EOF

# user NonAdminUser keys
cat > /etc/config/users/<NonAdminUser>/.ssh/authorized_keys << EOF
ssh-rsa key1
ssh-rsa key2
ssh-rsa key3
EOF
