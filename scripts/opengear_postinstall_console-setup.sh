#!/bin/bash

# Creating script path where you can add custom script to the box
mkdir /etc/config/scripts
chmod a+rwx /etc/config/scripts

# Console-setup script itself
cat > /etc/config/scripts/console-setup << EOF
#! /bin/bash

function usage {
    echo "Usage: \$(basename \$0) port-number speed label"
    exit 1
}

portnum="\$1"
speed="\$2"
label="\$3"

# Validate input
echo "\$portnum" | grep '^[0-9]\+$' >&/dev/null || usage
echo "\$speed" | grep '^[0-9]\+$' >&/dev/null || usage
echo "\$label" | grep '^[a-zA-Z0-9\.\-]\+$' >&/dev/null || usage

prefix=config.ports.port\${portnum}

sudo config \\
    -s \${prefix}.speed=\$speed \\
    -s \${prefix}.label="\$label" \\
    -s \${prefix}.parity=None \\
    -s \${prefix}.charsize=8 \\
    -s \${prefix}.stop=1 \\
    -s \${prefix}.flowcontrol=None \\
    -s \${prefix}.protocol=RS232 \\
    -s \${prefix}.terminal=vt220 \\
    -s \${prefix}.ssh=on \\
    -s \${prefix}.mode=portmanager
EOF

chmod a+x /etc/config/scripts/console-setup

# Create aliases for users
echo "alias port-setup='/etc/config/scripts/console-setup'" >> /.profile

cat > /etc/config/users/<yourNonAdminUser>/.profile << EOF
#! /bin/bash
alias port-setup='/etc/config/scripts/console-setup'
EOF
