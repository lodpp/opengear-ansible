#!/bin/bash

# Changing the default timeout of the fail2fban 
sed -i -e "s/timeout 60/timeout 600/" /etc/config/mf2b.conf

# Adding that nice banner for people that don't know how to leave a console port properly :)
echo "To leave this console type \"@.\"" > /etc/config/motd
