#!/bin/bash

# update the sudoers file for console-setup script
cat >> /etc/config/sudoers << EOF
%users ALL=(ALL) NOPASSWD: \\
    /etc/config/scripts/console-setup, \\
    /bin/config -s config.ports.*, \\             
    /bin/config -r serialconfig
EOF